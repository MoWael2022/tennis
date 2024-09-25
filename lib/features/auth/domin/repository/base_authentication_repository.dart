import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_entered.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';

abstract class BaseAuthenticationRepository {

Future<Either<Failure , UserDataReturned>> signUpRepo(UserDataEnteredForRegister data);
Future<Either<Failure , UserDataReturned>> signInRepo(UserDataEnterForLogin data);
Future<Either<Failure , bool>> logoutRepo();
}