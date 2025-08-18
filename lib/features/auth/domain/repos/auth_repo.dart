import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/faluires.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Faluire, UserEntity>> CreateUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
