import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:iconsax/iconsax.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي', style: TextStyles.bold19),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage?.isNotEmpty ?? false) {
              return Center(child: Text('حدث خطأ: ${state.errorMessage}'));
            }

            return _buildProfileForm(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context, ProfileState state) {
    final nameController = TextEditingController(text: state.name);
    final emailController = TextEditingController(text: state.email);
    final passwordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: GlobalKey<FormState>(), // يمكنك حفظه في متغير إذا احتجت له لاحقًا
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text('المعلومات الشخصية', style: TextStyles.semiBold13),
            const SizedBox(height: 8),
            _buildTextFormField(
              controller: nameController,
              icon: Iconsax.edit,
              obscureText: false,
              hintText: 'الاسم',
              keyboardType: TextInputType.text,
              validator: (value) =>
                  value == null || value.isEmpty ? 'يرجى إدخال الاسم' : null,
            ),
            const SizedBox(height: 12),
            _buildTextFormField(
              controller: emailController,
              icon: Iconsax.edit,
              obscureText: false,
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value == null || value.isEmpty
                  ? 'يرجى إدخال البريد الإلكتروني'
                  : null,
            ),
            const SizedBox(height: 24),
            const Text('تغيير كلمة المرور', style: TextStyles.semiBold13),
            const SizedBox(height: 8),
            _buildTextFormField(
              controller: passwordController,
              icon: state.isCurrentPasswordHidden
                  ? Iconsax.eye_slash
                  : Iconsax.eye,
              obscureText: state.isCurrentPasswordHidden,
              hintText: 'كلمة المرور الحالية',
              keyboardType: TextInputType.text,
              validator: (value) => value == null || value.isEmpty
                  ? 'يرجى إدخال كلمة المرور الحالية'
                  : null,
              onToggleVisibility: () {
                context.read<ProfileCubit>().toggleCurrentPasswordVisibility();
              },
            ),
            const SizedBox(height: 12),
            _buildTextFormField(
              controller: newPasswordController,
              icon: state.isNewPasswordHidden ? Iconsax.eye_slash : Iconsax.eye,
              obscureText: state.isNewPasswordHidden,
              hintText: 'كلمة المرور الجديدة',
              keyboardType: TextInputType.text,
              validator: (value) => value == null || value.isEmpty
                  ? 'يرجى إدخال كلمة المرور الجديدة'
                  : value.length < 6
                      ? 'كلمة المرور يجب أن تكون 6 أحرف على الأقل'
                      : null,
              onToggleVisibility: () {
                context.read<ProfileCubit>().toggleNewPasswordVisibility();
              },
            ),
            const SizedBox(height: 12),
            _buildTextFormField(
              controller: confirmPasswordController,
              icon: state.isConfirmPasswordHidden
                  ? Iconsax.eye_slash
                  : Iconsax.eye,
              obscureText: state.isConfirmPasswordHidden,
              hintText: 'تأكيد كلمة المرور الجديدة',
              keyboardType: TextInputType.text,
              validator: (value) => value != newPasswordController.text
                  ? 'كلمة المرور غير متطابقة'
                  : null,
              onToggleVisibility: () {
                context.read<ProfileCubit>().toggleConfirmPasswordVisibility();
              },
            ),
            const SizedBox(height: 64),
            CustomButton(
              text: 'حفظ التغييرات',
              onPressed: () {
                // if (Form.of(context)?.validate() ?? false) {
                //   // يمكنك استدعاء ميثود حفظ هنا من داخل Cubit
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('تم حفظ التغييرات')),
                //   );
                // }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required IconData icon,
    required bool obscureText,
    required String hintText,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    VoidCallback? onToggleVisibility,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyles.regular13,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: GestureDetector(
            onTap: onToggleVisibility,
            child: Icon(icon),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
