import 'package:weather_app/features/auth/domin/entites/user/user_data_entered.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';

abstract class BaseRemoteAuthenticationDataSource {

  Future<UserDataReturned> signUp (UserDataEnteredForRegister userDataEntered);
  Future<UserDataReturned> signIn (UserDataEnterForLogin userDataEntered);
  Future<bool> logout ();
}