import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      body: const SigninViewBody(),
    );
  }
}
