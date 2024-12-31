import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: Colors.transparent,
      child: SvgPicture.asset(image),
    );
  }
}
