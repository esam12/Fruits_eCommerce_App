import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';

class SuccessPaymentViewBody extends StatelessWidget {
  const SuccessPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 70.0),
            Image.asset(
              'assets/images/success_image.png',
              width: 155,
            ),
            const SizedBox(height: 35.0),
            const Text(
              'تم بنجاح !',
              style: TextStyles.bold16,
            ),
            const SizedBox(height: 12),
            Text(
              'رقم الطلب : 1245789663#',
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
            const SizedBox(height: 200.0),
            CustomButton(onPressed: () {}, text: 'تتبع الطلب'),
            TextButton(
              onPressed: () {},
              child: Text(
                'الرئيسية',
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
