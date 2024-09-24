import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 65);

    final double controlPointX = size.width / 2;
    final double controlPointY = size.height + 65;
    final double endPointX = size.width;
    final double endPointY = size.height - 65;

    path.quadraticBezierTo(controlPointX, controlPointY, endPointX, endPointY);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
