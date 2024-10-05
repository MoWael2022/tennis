import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:weather_app/features/auth/presentation/controller/user_cubit/user_cubit.dart';
import 'package:weather_app/features/home/presentation/controller/weather_cubit/weather_cubit.dart';

import '../../features/home/presentation/controller/google_map_cubit/google_map_cubit.dart';
import '../routers/routers.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => GoogleMapCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => WeatherCubit()),
      ],
      child: ResponsiveSizer(builder: (context, orientation, child) {
        return const MaterialApp(
          initialRoute: Routers.splashScreen,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      }),
    );
  }
}
