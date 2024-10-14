import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure/failure.dart';

abstract class BaseHomeUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}
