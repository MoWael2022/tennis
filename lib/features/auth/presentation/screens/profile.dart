import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:weather_app/features/auth/presentation/controller/user_cubit/user_cubit.dart';
import 'package:weather_app/features/auth/presentation/controller/user_cubit/user_state.dart';

import '../../../../core/routers/routers.dart';
import '../controller/auth_cubit/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    return BlocBuilder<UserCubit, UserDataState>(builder: (context, state) {
      if (state is LoadingUserData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        backgroundColor: const Color(0xFF0B043F),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: BlocListener<AuthCubit ,AuthState>(
              listener: (context ,state){
                if(state is LoadingState){
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                }else if(state is LogoutLoadedState){
                  Navigator.of(context).pushReplacementNamed(Routers.signScreen);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h), // Space from the top
                  CircleAvatar(
                    radius: 50.sp,
                    backgroundImage: const NetworkImage(
                     "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                    ),
                    backgroundColor: Colors.white.withOpacity(0.3),
                  ),
                  SizedBox(height: 3.h),

                  Text(
                    userCubit.userName,
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    userCubit.email,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 5.h),

                  SizedBox(height: 5.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor:
                            Colors.blueAccent, // Accent color as per theme
                      ),
                      onPressed: () {
                        // Edit profile action
                      },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                       BlocProvider.of<AuthCubit>(context).logout();
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
