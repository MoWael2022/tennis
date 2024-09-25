import 'package:get_it/get_it.dart';
import 'package:weather_app/features/auth/data/remote_data_source/base_remote_datasource.dart';
import 'package:weather_app/features/auth/data/remote_data_source/remote_authentication_datasource.dart';
import 'package:weather_app/features/auth/data/repository/authentication_repository.dart';
import 'package:weather_app/features/auth/domin/repository/base_authentication_repository.dart';
import 'package:weather_app/features/auth/domin/usecase/signIn_usecase.dart';

import '../../features/auth/domin/usecase/logout_usecase.dart';
import '../../features/auth/domin/usecase/signup_usecase.dart';

final instance = GetIt.instance;

class ServiceLocator {
  void inti() {
    //authentication
    instance
        .registerLazySingleton<SignInUseCase>(() => SignInUseCase(instance()));
    instance
        .registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(instance()));
    instance
        .registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(instance()));

    //repo Auth
    instance.registerLazySingleton<BaseAuthenticationRepository>(
        () => AuthenticationRepository(instance()));
    //data source auth
    instance.registerLazySingleton<BaseRemoteAuthenticationDataSource>(
        () => RemoteAuthenticationDataSource());
  }
}
