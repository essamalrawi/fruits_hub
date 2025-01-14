import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/auth/presentation/manager/cubits/signup/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/domain/repos/auth_repo.dart';
import 'widgets/signup_view_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(title: "حساب جديد", context: context),
        body: const SignupViewBlocConsumer(),
      ),
    );
  }
}
