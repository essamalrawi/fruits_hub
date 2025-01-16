import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/data/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../data/domain/entites/user_entite.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoading());
    final user =
        await authRepo.signUp(email: email, password: password, name: name);

    user.fold((faluire) => emit(SignupFaluire(message: faluire.message)),
        (user) => emit(SignupSuccuess(userModel: user)));
  }
}
