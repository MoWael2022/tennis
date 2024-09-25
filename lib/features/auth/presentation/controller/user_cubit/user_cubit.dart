import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';
import 'package:weather_app/features/auth/presentation/controller/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserDataState> {
  UserCubit() : super(InitState()) {
    _getData();

  }
  late String userName ;
  late String email ;


  _getData () async{
    emit(LoadingUserData());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("userName")!;
    email = prefs.getString("Email")!;
    //userData!.username = prefs.getString("userName")!;
    //userData!.uid = prefs.getString("userId")!;
    //userData!.email = prefs.getString("Email")!;
    emit(LoadedUserData());

  }
}
