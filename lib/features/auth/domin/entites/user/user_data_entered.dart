import 'package:equatable/equatable.dart';

class UserDataEnteredForRegister extends Equatable {
  final String? username;

  final String password;

  final String email;

  const UserDataEnteredForRegister({
    this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        password,
        email,
      ];
}

class UserDataEnterForLogin extends UserDataEnteredForRegister {
  const UserDataEnterForLogin({
    required super.email,
    required super.password,
  });
}
