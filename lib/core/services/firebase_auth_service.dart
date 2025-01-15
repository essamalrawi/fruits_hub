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
        throw CustomExceptions(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'البريد الالكتروني مستخدم بالفعل');
      } else {
        throw CustomExceptions(
            message: "لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى");
      }
    } catch (e) {
      throw CustomExceptions(
          message: "لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى");
    }
  }
}
