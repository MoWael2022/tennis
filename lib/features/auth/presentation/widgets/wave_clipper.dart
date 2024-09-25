import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from bottom-left corner
    path.lineTo(0.0, size.height / 2);

    // Create the reverse wave at the top
    var firstCurveStartPoint = Offset(size.width * .4, 10);
    var firstCurveEndPoint = Offset(size.width , 0);

    path.quadraticBezierTo(
        firstCurveStartPoint.dx, firstCurveStartPoint.dy, firstCurveEndPoint.dx, firstCurveEndPoint.dy);

    // Line down to the bottom-right corner
    path.lineTo(size.width,0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
