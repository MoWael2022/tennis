import 'package:firebase_auth/firebase_auth.dart';
import '../failure/failure.dart';

Failure handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return const  AuthFailure(message: 'Invalid email address');
    case 'user-not-found':
      return const AuthFailure(message: 'User not found');
    case 'wrong-password':
      return const AuthFailure(message: 'Wrong password');
    case 'email-already-in-use':
      return const AuthFailure(message: 'The email is already in use');
    case 'weak-password':
      return const AuthFailure(message: 'The password is too weak');
    case "invalid-credential":
      return const AuthFailure(message: 'Wrong email or Password');
    default:
      return ServerFailure(message: e.code);
  }
}