import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';

abstract class BaseAuthenticationUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}

class NoParameter {
  const NoParameter();
}
