import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';

import '../../../../core/component/dialogs.dart';
import '../../../../core/routers/routers.dart';
import '../controller/auth_cubit/auth_state.dart';
import '../widgets/button_style_authentication.dart';
import '../widgets/custom_text_fields.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

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
            prefs.setBool("isSignIn",true);
            Navigator.pop(context);
            Navigator.of(context).pushReplacementNamed(Routers.layoutPagesScreen);

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
                    'SIGN In',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextFields(
                    labelText: 'Email',
                    inputType: TextInputType.name,
                    controller: authCubit.loginEmailTextBox,
                    validator: (data) {
                      if (data.isEmpty) {
                        return "please Enter UserName";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFields(
                    isPasswordField: true,
                    validator: (validate) {
                      if (validate == "") {
                        return "please Enter Password";
                      }
                      return null;
                    },
                    labelText: 'Password',
                    inputType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: authCubit.loginPasswordTextBox,
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.all(5.h),
                    child: ButtonStyleAuthentication(
                      text: "Sign In",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authCubit.signIn();
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
