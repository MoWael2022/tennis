import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/service_locator/service_locator.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_entered.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';
import 'package:weather_app/features/auth/domin/usecase/base_authentication_usecase.dart';
import 'package:weather_app/features/auth/domin/usecase/signIn_usecase.dart';
import 'package:weather_app/features/auth/presentation/controller/auth_cubit/auth_state.dart';

import '../../../domin/usecase/logout_usecase.dart';
import '../../../domin/usecase/signup_usecase.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitState());

  TextEditingController loginEmailTextBox = TextEditingController();
  TextEditingController loginPasswordTextBox = TextEditingController();

  TextEditingController registerPasswordTextBox = TextEditingController();
  TextEditingController registerEmailTextBox = TextEditingController();
  TextEditingController registerUsernameTextBox = TextEditingController();
  TextEditingController registerConfirmPasswordTextBox =
      TextEditingController();

  UserDataReturned? currentUser;

  signIn() async {
    emit(LoadingState());
    final data = instance<SignInUseCase>();

    final result = await data.call(
      UserDataEnterForLogin(
          email: loginEmailTextBox.text, password: loginPasswordTextBox.text),
    );
    result.fold((l) {

      emit(ErrorState(l.message));
    }, (r) {
      loginEmailTextBox.clear();
      loginPasswordTextBox.clear();
      emit(LoadedState(r));
    });
  }

  signUp() async {
    emit(LoadingState());

    final data = instance<SignUpUseCase>();
    final result = await data.call(
      UserDataEnteredForRegister(
          email: registerEmailTextBox.text,
          password: registerPasswordTextBox.text,
          username: registerUsernameTextBox.text),
    );
    result.fold((l) {

      emit(ErrorState(l.message));
    }, (r) {
      registerConfirmPasswordTextBox.clear();
      registerEmailTextBox.clear();
      registerPasswordTextBox.clear();
      registerUsernameTextBox.clear();
      emit(LoadedState(r));
    });
  }

  logout() async {
    emit(LoadingState());
    final data = instance<LogoutUseCase>();
    final result = await data.call(const NoParameter());
    result.fold((l) {
      emit(ErrorState(l.message));
    }, (r) {
      emit(LogoutLoadedState());
    });

  }
}
