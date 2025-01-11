import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_decorations.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyles.bold13),
        const SizedBox(height: 8.0),
        Container(
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
