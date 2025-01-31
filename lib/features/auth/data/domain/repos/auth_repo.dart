import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/faluires.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp(
      {required String email, required String password, required String name});

  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password});

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
}
