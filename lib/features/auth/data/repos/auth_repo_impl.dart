import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/errors/custom_exceptions.dart';
import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import 'package:fruits_hub/features/auth/data/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../../../core/utils/backend_endpoints.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.signUp(
          email: email, password: password, name: name);

      UserEntity userEntite =
          UserEntity(email: email, name: name, uId: user.uid);
      var isDataExists = await databaseService.checkIfDataExists(
          path: BackendEndpoints.addUserData, documentId: user.uid);

      if (isDataExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(
            user: UserModel(name: name, email: email, uId: user.uid));
      }
      return Right(userEntite);
    } on CustomExceptions catch (e) {
      await deleteUser(user);

      return left(ServerFaluire(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in signup: ${e.toString()}');
      return Left(ServerFaluire("لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى."));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password}) async {
    try {
      var user =
          await firebaseAuthService.signIn(email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFaluire(e.message));
    } catch (e) {
      log('Exception in signup: ${e.toString()}');
      return Left(ServerFaluire("لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      var userModel = UserModel.fromFirebaseUser(user);
      var isDataExists = await databaseService.checkIfDataExists(
          path: BackendEndpoints.addUserData, documentId: user.uid);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      if (isDataExists) {
        await getUserData(uid: user.uid);
      } else {
        await saveUserData(user: userModel);
      }

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      await deleteUser(user);
      if (e.code == 'account-exists-with-different-credential') {
        return left(
          ServerFaluire(
            'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
          ),
        );
      } else {
        return left(
          ServerFaluire(
            'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          ),
        );
      }
    } catch (e) {
      await deleteUser(user);
      log('Exception in signup: ${e.toString()}');
      return Left(ServerFaluire("لقد حدث خطأ ما، الرجاء المحاولة مرة اخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userModel = UserModel.fromFirebaseUser(user);
      var isDataExists = await databaseService.checkIfDataExists(
          path: BackendEndpoints.addUserData, documentId: user.uid);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      if (isDataExists) {
        await getUserData(uid: user.uid);
      } else {
        await saveUserData(user: userModel);
      }
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      await deleteUser(user);

      if (e.code == 'account-exists-with-different-credential') {
        return left(
          ServerFaluire(
            'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
          ),
        );
      } else {
        return left(
          ServerFaluire(
            'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          ),
        );
      }
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFaluire(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future addUserData({
    required UserEntity user,
  }) async {
    await databaseService.addData(
        path: BackendEndpoints.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) {
    return databaseService
        .getData(path: BackendEndpoints.gettUserData, uId: uid)
        .then((value) => UserModel.fromJson(value));
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
