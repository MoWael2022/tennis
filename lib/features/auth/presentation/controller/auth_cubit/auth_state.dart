import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';

abstract class AuthState {}

class InitState extends AuthState {}

class LoadingState extends AuthState {}

class LoadedState extends AuthState {
  UserDataReturned user ;
  LoadedState(this.user);
}

class ErrorState extends AuthState {
  String messageError ;
  ErrorState(this.messageError);
}

class LogoutLoadedState extends AuthState{}
