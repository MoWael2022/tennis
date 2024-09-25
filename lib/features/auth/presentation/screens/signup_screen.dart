import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/auth/presentation/widgets/button_style_authentication.dart';
import 'package:weather_app/features/auth/presentation/widgets/custom_text_fields.dart';

import '../../../../core/component/dialogs.dart';
import '../../../../core/routers/routers.dart';
import '../controller/auth_cubit/auth_cubit.dart';
import '../controller/auth_cubit/auth_state.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is LoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent dismissing the dialog
              builder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          } else if (state is LoadedState) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("userName", state.user.username);
            prefs.setString("userId", state.user.uid);
            prefs.setString("Email", state.user.email);
            Navigator.pop(context);
            Navigator.of(context).pushReplacementNamed(Routers.profileScreen);
          } else if (state is ErrorState) {
            Navigator.pop(context);
            Dialogs.showErrorDialogs(context, state.messageError);
          }
        },
        child: Form(
          key: formKey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0B043F), Color(0xFF000000)],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ListView(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextFields(
                    labelText: 'FULL NAME',
                    inputType: TextInputType.name,
                    controller: authCubit.registerUsernameTextBox,
                    validator: (data) {
                      if (data.isEmpty) {
                        return "please Enter UserName";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFields(
                    validator: (validate) {
                      final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (validate == "") {
                        return "please Enter Email";
                      } else if (!emailRegExp.hasMatch(validate!)) {
                        return "please Enter valid Email for example@gmail.com";
                      }
                      return null;
                    },
                    labelText: 'Email',
                    inputType: TextInputType.name,
                    controller: authCubit.registerEmailTextBox,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFields(
                    isPasswordField: true,
                    validator: (validate) {
                      final passwordRegExp = RegExp(
                          r"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
                      if (validate == "") {
                        return "please Enter Password";
                      } else if (!passwordRegExp.hasMatch(validate!)) {
                        return 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character';
                      }
                      return null;
                    },
                    labelText: 'Password',
                    inputType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: authCubit.registerPasswordTextBox,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFields(
                    isPasswordField: true,
                    validator: (validate) {
                      if (validate == "") {
                        return "please Enter Confirm Password";
                      } else if (validate !=
                          authCubit.registerPasswordTextBox.text) {
                        return "Password do not match";
                      }
                      return null;
                    },
                    labelText: 'Confirm Password',
                    inputType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: authCubit.registerConfirmPasswordTextBox,
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.all(5.h),
                    child: ButtonStyleAuthentication(
                      text: "Sign UP",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authCubit.signUp();
                        }
                      },
                      colorText: Colors.white,
                      colorButton: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
