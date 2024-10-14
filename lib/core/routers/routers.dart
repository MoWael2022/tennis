import 'package:flutter/material.dart';
import 'package:weather_app/features/auth/presentation/screens/signIn_screen.dart';
import 'package:weather_app/features/auth/presentation/screens/sign_screen.dart';
import 'package:weather_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:weather_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:weather_app/features/home/presentation/screens/home_screen.dart';
import 'package:weather_app/features/home/presentation/screens/page_layout.dart';
import 'package:weather_app/features/home/presentation/screens/weather_state_screen.dart';

import '../../features/auth/presentation/screens/profile.dart';

class Routers {
  static const String splashScreen = '/';
  static const String signInScreen = '/signIn';
  static const String signUpScreen = '/signUp';
  static const String signScreen = '/sign';
  static const String profileScreen = '/profile';
  static const String homeScreen = '/home';
  static const String weatherScreen = '/weather';
  static const String layoutPagesScreen = '/layout';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routers.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routers.signInScreen:
        return MaterialPageRoute(builder: (context) => SignInScreen());
      case Routers.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case Routers.signScreen:
        return MaterialPageRoute(builder: (context) => const SignScreen());
      case Routers.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routers.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routers.weatherScreen:
        return MaterialPageRoute(builder: (context) =>const WeatherScreen());
      case Routers.layoutPagesScreen:
        return MaterialPageRoute(builder: (context) =>const PageLayout());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(
                child: Text("No Route Found"),
              ),
            ));
  }
}
