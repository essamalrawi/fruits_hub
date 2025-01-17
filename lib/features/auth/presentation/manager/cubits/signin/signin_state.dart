part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccuess extends SigninState {
  final UserEntite userModel;
  SigninSuccuess({required this.userModel});
}

final class SigninFaluire extends SigninState {
  final String message;
  SigninFaluire({required this.message});
}
