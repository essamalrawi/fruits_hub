import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());
    final result = await authRepo.CreateUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (faluire) => emit(SignupFailure(message: faluire.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
