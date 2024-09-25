import 'package:equatable/equatable.dart';

class UserDataReturned extends Equatable {
  String username;

  String uid;

  String email;

  UserDataReturned({
    required this.username,
    required this.email,
    required this.uid,
  });



  @override
  List<Object?> get props => [
    username,
    uid,
    email,
  ];
}
