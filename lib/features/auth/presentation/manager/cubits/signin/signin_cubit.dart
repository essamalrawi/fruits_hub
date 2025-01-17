import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import 'package:fruits_hub/features/auth/data/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(SigninLoading());

    var user = await authRepo.signIn(email: email, password: password);
    user.fold((faluire) => emit(SigninFaluire(message: faluire.message)),
        (user) => emit(SigninSuccuess(userModel: user)));
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var user = await authRepo.signInWithGoogle();
    user.fold((faluire) => emit(SigninFaluire(message: faluire.message)),
        (user) => emit(SigninSuccuess(userModel: user)));
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var user = await authRepo.signInWithFacebook();
    user.fold((faluire) => emit(SigninFaluire(message: faluire.message)),
        (user) => emit(SigninSuccuess(userModel: user)));
  }
}
