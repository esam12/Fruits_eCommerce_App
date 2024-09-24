import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/widgets/curved_edges/curved_edges_widget.dart';

class ProductDetailHeaderShape extends StatelessWidget {
  const ProductDetailHeaderShape({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: AppColors.gridColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            /// Background Custom Shapes

            child,
          ],
        ),
      ),
    );
  }
}
