import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/features/auth/data/remote_data_source/base_remote_datasource.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_entered.dart';
import 'package:weather_app/features/auth/domin/entites/user/user_data_returned.dart';

import '../../../../core/network/firebase_error_handling.dart';
import '../models/user_model.dart';

class RemoteAuthenticationDataSource
    implements BaseRemoteAuthenticationDataSource {
  final _authentication = FirebaseAuth.instance;

  @override
  Future<UserDataReturned> signUp(
      UserDataEnteredForRegister userDataEntered) async {
    try {
      final userCredential = await _authentication.createUserWithEmailAndPassword(
          email: userDataEntered.email, password: userDataEntered.password);
      await userCredential.user!.updateDisplayName(userDataEntered.username);
      return UserModel.fromFirebase(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw handleFirebaseAuthException(e);
    }
  }

  @override
  Future<UserDataReturned> signIn(UserDataEnterForLogin userDataEntered) async {
    try {
      final userCredential = await _authentication.signInWithEmailAndPassword(
          email: userDataEntered.email, password: userDataEntered.password);
      return UserModel.fromFirebase(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw handleFirebaseAuthException(e);
    }
  }

  @override
  Future<bool> logout() async{
    try {
      await _authentication.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      throw handleFirebaseAuthException(e);
    }

  }
}
