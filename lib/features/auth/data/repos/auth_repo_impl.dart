import 'dart:developer';

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
      log('Exception in signup: ${e.toString()}');
      return Left(ServerFaluire("لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future<Either<Faluires, UserEntite>> signIn(
      {required String email, required String password}) async {
    try {
      var user =
          await firebaseAuthService.login(email: email, password: password);
      return Right(UserModel.factoryFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(ServerFaluire(e.message));
    } catch (e) {
      log('Exception in signup: ${e.toString()}');
      return Left(ServerFaluire("لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future<Either<Faluires, UserEntite>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.factoryFirebaseUser(user));
    } catch (e) {
      log('Exception in signup: ${e.toString()}');
      return Left(ServerFaluire("لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future<Either<Faluires, UserEntite>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.factoryFirebaseUser(user));
    } catch (e) {
      log('Exception in signup: ${e.toString()}');
      return Left(ServerFaluire("لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى."));
    }
  }
}
