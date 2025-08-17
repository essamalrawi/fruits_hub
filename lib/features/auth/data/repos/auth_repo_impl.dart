import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Faluire, UserEntity>> CreateUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    throw UnimplementedError();
  }
}
