import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';

import '../../../../../core/utils/app_text_styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              textInputType: TextInputType.emailAddress,
              hintText: "البريد الإلكتروني",
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor)),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(
              height: 33,
            ),
            const DontHaveAnAccountWidget(),
            const SizedBox(
              height: 33,
            ),
            const OrDivider(),
          ],
        ),
      ),
    );
  }
}
