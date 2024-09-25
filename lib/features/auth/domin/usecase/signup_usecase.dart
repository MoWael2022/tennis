import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_entered.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';
import 'package:weather_app/features/auth/domin/usecase/base_authentication_usecase.dart';

import '../repository/base_authentication_repository.dart';

class SignUpUseCase extends BaseAuthenticationUseCase<
    UserDataEnteredForRegister, UserDataReturned> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  SignUpUseCase(this.baseAuthenticationRepository);

  @override
  Future<Either<Failure, UserDataReturned>> call(
      UserDataEnteredForRegister input) async {
    return await baseAuthenticationRepository.signUpRepo(input);
  }
}
