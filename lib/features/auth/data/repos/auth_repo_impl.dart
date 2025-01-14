import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/custom_exceptions.dart';
import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import 'package:fruits_hub/features/auth/data/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<UserEntite> login({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Faluires, UserEntite>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await firebaseAuthService.signup(
          email: email, password: password, name: name);

      return Right(UserModel.factoryFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFaluire(e.message));
    } catch (e) {
      return Left(ServerFaluire('An error occurred. Please try again.'));
    }
  }
}
