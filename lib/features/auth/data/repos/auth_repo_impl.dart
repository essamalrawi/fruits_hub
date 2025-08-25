import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Faluire, UserEntity>> CreateUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Exception in CreateUserWithEmailAndPassword: ${e.toString()}');

      return Left(ServerFaluire(e.message));
    } catch (e) {
      return Left(ServerFaluire("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا."));
    }
  }

  @override
  Future<Either<Faluire, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFaluire(e.message));
    } catch (e) {
      return Left(ServerFaluire("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا."));
    }
  }

  @override
  Future<Either<Faluire, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFaluire(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return Left(ServerFaluire("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا."));
    }
  }

  @override
  Future<Either<Faluire, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFaluire(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFaluire("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا."));
    }
  }
}
