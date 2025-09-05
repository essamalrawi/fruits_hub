import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_message.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';

class SignInViewBlocConsumer extends StatelessWidget {
  const SignInViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (BuildContext context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, HomeView.routeName);
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (BuildContext context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
