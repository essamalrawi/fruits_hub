import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthException;

  AuthRepoImpl({required this.firebaseAuthException});

  @override
  Future<Either<Faluire, UserEntity>> CreateUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthException.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFaluire(e.message));
    } catch (e) {
      return Left(ServerFaluire("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا."));
    }
  }
}
 