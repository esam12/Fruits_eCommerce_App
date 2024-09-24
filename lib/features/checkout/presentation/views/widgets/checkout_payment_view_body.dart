import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_header_item.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_payment_item.dart';

class CheckoutPaymentViewBody extends StatelessWidget {
  const CheckoutPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Row(
              children: [
                CheckoutHeaderItem(title: 'الشحن', isSelected: true, no: '1'),
                SizedBox(width: 24),
                CheckoutHeaderItem(title: 'العنوان', isSelected: true, no: '2'),
                SizedBox(width: 24),
                CheckoutHeaderItem(title: 'الدفع', isSelected: true, no: '3'),
                SizedBox(width: 24),
                CheckoutHeaderItem(
                    title: 'المراجعه', isSelected: false, no: '4'),
              ],
            ),
            const SizedBox(height: 24),
            const Text('أختار طريقه الدفع المناسبه :',
                style: TextStyles.bold13),
            const SizedBox(height: 12),
            Text(
              'من فضلك اختر طريقه الدفع المناسبه لك.',
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF616A6B),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 45,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const CheckoutPaymentItem(),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: 4,
              ),
            ),
            const SizedBox(height: 16),
            const Column(
              children: [
                CustomTextFormField(hintText: 'اسم حامل البطاقه'),
                SizedBox(height: 8),
                CustomTextFormField(hintText: 'رقم البطاقه'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextFormField(hintText: 'تاريخ الصلاحيه')),
                    SizedBox(width: 16),
                    Expanded(child: CustomTextFormField(hintText: 'CVV')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(value: true, onChanged: (val) {}),
                Text(
                  'جعل البطاقة افتراضية',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF616A6B),
                  ),
                )
              ],
            ),
            const SizedBox(height: 65),
            CustomButton(onPressed: () {}, text: 'تأكيد & استمرار')
          ],
        ),
      ),
    );
  }
}


