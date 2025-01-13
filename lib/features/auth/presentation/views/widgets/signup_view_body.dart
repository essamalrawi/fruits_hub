import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

import '../../../../../constants.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const CustomTextFormField(
                hintText: 'الاسم كامل',
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              suffexIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
              textInputType: TextInputType.visiblePassword,
              hintText: "كلمة المرور",
            ),
            const SizedBox(
              height: 16,
            ),
            const TermsAndConditions(),
            const SizedBox(
              height: 30,
            ),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            const SizedBox(
              height: 26,
            ),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
