import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body.dart';
import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../manager/cubits/signin/signin_cubit.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccuess) {}
        if (state is LoginFaluire) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LoginLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
