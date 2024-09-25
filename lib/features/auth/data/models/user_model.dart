import 'package:firebase_auth/firebase_auth.dart';

import '../../domin/entites/user/user_data_returned.dart';

class UserModel extends UserDataReturned {
  UserModel(
      {required super.username, required super.email, required super.uid});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      username: user.displayName ?? '',
      email: user.email!,
      uid: user.uid,
    );
  }
}
