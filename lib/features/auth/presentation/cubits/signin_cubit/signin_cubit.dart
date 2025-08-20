import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signinUser(String email, String password) async {
    emit(SigninLoading());

    var result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (userEntity) => (emit(SigninSuccess(userEntity: userEntity))),
    );
  }
}
