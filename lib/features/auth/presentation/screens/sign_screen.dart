import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/routers/routers.dart';
import 'package:weather_app/features/auth/presentation/widgets/button_style_authentication.dart';

import '../widgets/sign_screen_custom_clipper.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.white,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: SignScreenCustomCliper(),
            child: Container(
              height: 55.h,
              width: 100.w,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  ButtonStyleAuthentication(
                    colorButton: const Color(0xFF075FA4),
                    colorText: Colors.white,
                    text: "Sign In",
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routers.signInScreen);
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ButtonStyleAuthentication(
                    colorButton: Colors.white,
                    colorText: Colors.black,
                    text: "Sign Up",
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routers.signUpScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
