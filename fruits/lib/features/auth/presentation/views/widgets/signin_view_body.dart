import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/constants.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/core/widgets/password_field.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:fruits/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        /// Login Form Body
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value ?? '';
                },
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value ?? '';
                },
              ),
              const SizedBox(height: 16.0),

              /// Forget Password
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              ),
              const SizedBox(height: 33.0),

              /// Login Button
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SigninCubit>()
                          .signin(email, password);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'تسجيل دخول'),
              const SizedBox(height: 33.0),

              /// TextSpan Widget for dont have an account
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 33.0),
              const OrDivider(),
              const SizedBox(height: 33.0),

              /// Social Login Buttons
              SocialLoginButton(
                icon: Assets.imagesGoogleIcon,
                label: 'تسجيل دخول بواسطة جوجل',
                onPressed: () {
                  context.read<SigninCubit>().signinWithGoogle();
                },
              ),
              const SizedBox(height: 16.0),
              SocialLoginButton(
                icon: Assets.imagesApplIcon,
                label: 'تسجيل دخول بواسطة أبل',
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
              SocialLoginButton(
                icon: Assets.imagesFacebookIcon,
                label: 'تسجيل دخول بواسطة فيسبوك',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
