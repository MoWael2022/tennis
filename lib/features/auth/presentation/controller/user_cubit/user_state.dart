import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';

abstract class UserDataState {}
class InitState extends UserDataState {}
class LoadingUserData extends UserDataState{}
class LoadedUserData extends UserDataState{}
class GetUserDataState extends UserDataState{
  UserDataReturned data ;
  GetUserDataState(this.data);
}



