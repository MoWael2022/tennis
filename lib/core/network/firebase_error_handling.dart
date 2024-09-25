import 'package:firebase_auth/firebase_auth.dart';
import '../failure/failure.dart';

Failure handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return const  AuthFailure('Invalid email address');
    case 'user-not-found':
      return const AuthFailure('User not found');
    case 'wrong-password':
      return const AuthFailure('Wrong password');
    case 'email-already-in-use':
      return const AuthFailure('The email is already in use');
    case 'weak-password':
      return const AuthFailure('The password is too weak');
    case "invalid-credential":
      return const AuthFailure('Wrong email or Password');
    default:
      return ServerFailure(e.code);
  }
}