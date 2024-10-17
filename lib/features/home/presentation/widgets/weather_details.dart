import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildWeatherDetails extends StatelessWidget {
  const BuildWeatherDetails(
      {super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            color: Colors.white54,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
