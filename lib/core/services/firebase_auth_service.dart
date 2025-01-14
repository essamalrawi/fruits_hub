import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exceptions.dart';

class FirebaseAuthService {
  Future<User> signup(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
            message: 'The account already exists for that email.');
      } else {
        throw CustomExceptions(message: 'An error occurred. Please try again.');
      }
    } catch (e) {
      throw CustomExceptions(message: 'An error occurred. Please try again.');
    }
  }
}
