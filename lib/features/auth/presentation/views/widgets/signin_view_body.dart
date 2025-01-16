import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/manager/cubits/signin/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                textInputType: TextInputType.emailAddress,
                hintText: "البريد الإلكتروني",
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SigninCubit>()
                          .logIn(email: email, password: password);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'تسجيل دخول'),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialSigninButton(
                  image: Assets.imagesGoogleIcon,
                  title: 'تسجيل بواسطة جوجل',
                  onPressed: () {
                    context.read<SigninCubit>().signInWithGoogle();
                  }),
              const SizedBox(
                height: 16,
              ),
              SocialSigninButton(
                  image: Assets.imagesAppleIcon,
                  title: 'تسجيل بواسطة أبل',
                  onPressed: () {}),
              const SizedBox(
                height: 16,
              ),
              SocialSigninButton(
                  image: Assets.imagesFacebookIcon,
                  title: 'تسجيل بواسطة فيسبوك',
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
