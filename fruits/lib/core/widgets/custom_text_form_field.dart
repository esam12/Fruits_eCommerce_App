import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText, this.onSaved,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle:
            TextStyles.bold13.copyWith(color: AppColors.textFieldHintTextColor),
        filled: true,
        fillColor: AppColors.textFieldFilledColor,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
    );
  }
}
