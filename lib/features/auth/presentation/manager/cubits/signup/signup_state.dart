part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccuess extends SignupState {
  final UserEntity userModel;
  SignupSuccuess({required this.userModel});
}

final class SignupFaluire extends SignupState {
  final String message;

  SignupFaluire({required this.message});
}
