import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/constant/image_path_manager.dart';
import 'package:weather_app/core/routers/routers.dart';

import '../widgets/wave_clipper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showShadow = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        showShadow = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: .9,
                image: AssetImage(ImagePathManager.splashScreenImage),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: showShadow ? 1 : 0,
              curve: Curves.easeIn,
              child: ClipPath(
                clipper: WaveClipper(),
                child: SizedBox(
                  height: 50.h,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 40.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Color(0xff0b043f),
                        ],
                      ),
                      color: Colors.black.withOpacity(0.7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.9),
                          spreadRadius: 20,
                          blurRadius: 100,
                          blurStyle: BlurStyle.inner,
                          offset: const Offset(10, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.w, bottom: 3.h),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routers.signScreen);
                        },
                        child: const Text('Skip'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
