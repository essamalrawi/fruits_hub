import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/domain/repos/auth_repo.dart';
import '../manager/cubits/signin/signin_cubit.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(
          appBar: buildAppBar(title: "تسجيل دخول", context: context),
          body: const SignInViewBodyBlocConsumer()),
    );
  }
}
