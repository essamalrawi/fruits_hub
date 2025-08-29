import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Faluire, UserEntity>> CreateUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;

    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      var userEntity = UserEntity(name: name, email: email, uId: user.uid);

      await addUserData(user: userEntity);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      await deleteUser(user);

      log('Exception in CreateUserWithEmailAndPassword: ${e.toString()}');

      return Left(ServerFaluire(e.message));
    } catch (e) {
      await deleteUser(user);

      return Left(ServerFaluire("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا."));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
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

      var userEntity = await getUserData(uid: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFaluire(e.message));
    } catch (e) {
      return Left(ServerFaluire("حدث خطأ. يرجى المحاولة مرة أخرى لاحقًا."));
    }
  }

  @override
  Future<Either<Faluire, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);

      var isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoints.isUserExist,
        documentId: user.uid,
      );

      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFaluire(e.message));
    } catch (e) {
      await deleteUser(user);
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

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.AddData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoints.addUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }
}
