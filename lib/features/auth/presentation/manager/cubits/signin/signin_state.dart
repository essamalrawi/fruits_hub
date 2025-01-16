part of 'signin_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccuess extends LoginState {
  final UserEntite userModel;
  LoginSuccuess({required this.userModel});
}

final class LoginFaluire extends LoginState {
  final String message;
  LoginFaluire({required this.message});
}
