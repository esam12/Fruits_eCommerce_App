import 'package:flutter/material.dart';

class TowTextAndSpaceBetween extends StatelessWidget {
  const TowTextAndSpaceBetween({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  });

  final String label;
  final String value;
  final TextStyle? labelStyle, valueStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }
}
