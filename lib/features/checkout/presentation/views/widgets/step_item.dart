import 'package:flutter/material.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.title,
    required this.index,
    required this.isSelected,
  });

  final String title, index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(title: title, index: index),
      secondChild: ActiveStepItem(title: title),
      crossFadeState:
          isSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
