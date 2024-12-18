import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/widgets/text_form/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      obscureText: obscureText,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => obscureText = !obscureText),
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye_rounded,
                color: AppColors.textFieldSuffixIconColor,
              ) 
            : const Icon(
                Icons.visibility_off_rounded,
                color: AppColors.textFieldSuffixIconColor,
              ),
      ),
    );
  }
}
