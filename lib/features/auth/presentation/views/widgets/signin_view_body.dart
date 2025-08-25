import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';

import 'dont_have_account_widget.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().signinUser(email, password);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'تسجيل دخول',
                ),
                const SizedBox(height: 33),
                const DontHaveAnAccountWidget(),
                const SizedBox(height: 33),
                const OrDivider(),
                const SizedBox(height: 16),
                SocialLoginButton(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithGoogle();
                  },
                  image: Assets.imagesGoogleIcon,
                  title: 'تسجيل بواسطة جوجل',
                ),
                const SizedBox(height: 16),
                SocialLoginButton(
                  onPressed: () {},
                  image: Assets.imagesApplIcon,
                  title: 'تسجيل بواسطة أبل',
                ),
                const SizedBox(height: 16),
                SocialLoginButton(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithFacebook();
                  },
                  image: Assets.imagesFacebookIcon,
                  title: 'تسجيل بواسطة فيسبوك',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
