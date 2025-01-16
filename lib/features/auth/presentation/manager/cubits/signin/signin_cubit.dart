import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import 'package:fruits_hub/features/auth/data/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<LoginState> {
  SigninCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> logIn({required String email, required String password}) async {
    emit(LoginLoading());

    var user = await authRepo.signIn(email: email, password: password);
    user.fold((faluire) => emit(LoginFaluire(message: faluire.message)),
        (user) => emit(LoginSuccuess(userModel: user)));
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var user = await authRepo.signInWithGoogle();
    user.fold((faluire) => emit(LoginFaluire(message: faluire.message)),
        (user) => emit(LoginSuccuess(userModel: user)));
  }
}
