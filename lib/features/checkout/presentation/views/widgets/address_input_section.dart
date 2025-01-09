import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/text_form/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          const CustomTextFormField(
              hintText: 'الاسم الكامل', keyboardType: TextInputType.text),
          const SizedBox(height: 8.0),
          const CustomTextFormField(
              hintText: 'البريد الالكتروني', keyboardType: TextInputType.text),
          const SizedBox(height: 8.0),
          const CustomTextFormField(
              hintText: 'العنوان', keyboardType: TextInputType.text),
          const SizedBox(height: 8.0),
          const CustomTextFormField(
              hintText: 'المدينه', keyboardType: TextInputType.text),
          const SizedBox(height: 8.0),
          const CustomTextFormField(
              hintText: 'رقم الطابق, رقم الشقة..',
              keyboardType: TextInputType.text),
          const SizedBox(height: 8.0),
          const CustomTextFormField(
              hintText: 'رقم الهاتف', keyboardType: TextInputType.phone),
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
        ],
      ),
    );
  }
}
