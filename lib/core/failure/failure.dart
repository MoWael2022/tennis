import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String message ;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}



class ServerFailure extends Failure {
  const ServerFailure([super.message = "Server failure"]);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = "Authentication failure"]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = "Network connection failure"]);
}