import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/auth/data/remote_data_source/base_remote_datasource.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_entered.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';
import 'package:weather_app/features/auth/domin/repository/base_authentication_repository.dart';

class AuthenticationRepository implements BaseAuthenticationRepository {
  BaseRemoteAuthenticationDataSource baseRemoteAuthenticationDataSource;

  AuthenticationRepository(this.baseRemoteAuthenticationDataSource);

  @override
  Future<Either<Failure, UserDataReturned>> signInRepo(
      UserDataEnterForLogin data) async {
    try {
      final result = await baseRemoteAuthenticationDataSource.signIn(data);
      return Right(result);
    } catch (failure) {
      return Left(failure as Failure);
    }
  }

  @override
  Future<Either<Failure, UserDataReturned>> signUpRepo(
      UserDataEnteredForRegister data) async {
    try {
      final result = await baseRemoteAuthenticationDataSource.signUp(data);
      return Right(result);
    } catch (failure) {
      // Handle the error correctly here
      return Left(failure as Failure);
    }
  }

  @override
  Future<Either<Failure, bool>> logoutRepo() async{
    try {
      final result = await baseRemoteAuthenticationDataSource.logout();
      return Right(result);
    } catch (failure) {
      // Handle the error correctly here
      return Left(failure as Failure);
    }
  }

}
