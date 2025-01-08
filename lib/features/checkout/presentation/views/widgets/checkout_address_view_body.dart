import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/text_form/custom_text_form_field.dart';

class CheckoutAddressViewBody extends StatelessWidget {
  const CheckoutAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
           
            const SizedBox(height: 24.0),
            const CustomTextFormField(hintText: 'الاسم الكامل'),
            const SizedBox(height: 8.0),
            const CustomTextFormField(hintText: 'البريد الالكتروني'),
            const SizedBox(height: 8.0),
            const CustomTextFormField(hintText: 'العنوان'),
            const SizedBox(height: 8.0),
            const CustomTextFormField(hintText: 'المدينه'),
            const SizedBox(height: 8.0),
            const CustomTextFormField(hintText: 'رقم الطابق, رقم الشقة..'),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Switch(value: true, onChanged: (val) {}),
                const SizedBox(width: 8.0),
                Text(
                  'حفظ العنوان',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.greyTextColor),
                )
              ],
            ),
            const SizedBox(height: 64.0),
            CustomButton(onPressed: () {}, text: 'التالي')
          ],
        ),
      ),
    );
  }
}
