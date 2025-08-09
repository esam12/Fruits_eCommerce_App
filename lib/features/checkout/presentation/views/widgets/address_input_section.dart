import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/text_form/custom_text_form_field.dart';
import 'package:fruits/features/orders/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.name = value!;
                  },
                  hintText: 'الاسم الكامل',
                  keyboardType: TextInputType.text),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.email = value!;
                  },
                  hintText: 'البريد الالكتروني',
                  keyboardType: TextInputType.text),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.address =
                        value!;
                  },
                  hintText: 'العنوان',
                  keyboardType: TextInputType.text),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.city = value!;
                  },
                  hintText: 'المدينه',
                  keyboardType: TextInputType.text),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                  onSaved: (value) {
                    context
                        .read<OrderEntity>()
                        .shippingAddress
                        .addressDetails = value!;
                  },
                  hintText: 'رقم الطابق, رقم الشقة..',
                  keyboardType: TextInputType.text),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.phoneNumber =
                        value!;
                  },
                  hintText: 'رقم الهاتف',
                  keyboardType: TextInputType.phone),
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
        ),
      ),
    );
  }
}
