import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "حساب جديد", context: context),
      body: const SignupViewBody(),
    );
  }
}
