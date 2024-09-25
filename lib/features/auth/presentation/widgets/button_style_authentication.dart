import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

class ButtonStyleAuthentication extends StatelessWidget {
  const ButtonStyleAuthentication(
      {super.key,
      required this.colorButton,
      required this.colorText,
      required this.onPressed,
      required this.text});

  final Color colorButton;
  final VoidCallback onPressed;
  final Color colorText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 70.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: colorButton),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: colorText, fontSize: 7.w),
        ),
      ),
    );
  }
}
