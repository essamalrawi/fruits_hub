import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/faluires.dart';

abstract class AuthRepo {
  Future<Either<Faluires, UserEntite>> signUp(
      {required String email, required String password, required String name});
  Future<Either<Faluires, UserEntite>> signIn(
      {required String email, required String password});

  Future<Either<Faluires, UserEntite>> signInWithGoogle();
  Future<Either<Faluires, UserEntite>> signInWithFacebook();
}
