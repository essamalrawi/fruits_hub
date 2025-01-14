import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/faluires.dart';

abstract class AuthRepo {
  Future<Either<Faluires, UserEntite>> signUp(
      {required String email, required String password, required String name});
  Future<UserEntite> login({required String email, required String password});
}
