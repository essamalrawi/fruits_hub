import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import '../../../../../constants/assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_an_account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextField(
              hint: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              icon: Icon(Icons.remove_red_eye, color: Color(0xffc9cecf)),
              hint: "كلمة المرور",
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.bold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33),
            CustomButton(onPressed: () {}, text: "تسجيل الدخول"),
            const SizedBox(height: 33),
            const DontHaveAnAccountWidget(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            const SocialLoginButton(
              title: "تسجيل بواسطة جوجل",
              image: Assets.imagesGoogleIcon,
            ),
            const SizedBox(height: 16),
            const SocialLoginButton(
              title: "تسجيل بواسطة أبل",
              image: Assets.imagesApplIcon,
            ),
            const SizedBox(height: 16),
            const SocialLoginButton(
              title: "تسجيل بواسطة فيسبوك",
              image: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
