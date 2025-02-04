import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../signup_view.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'تمتلك حساب بالفعل؟',
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xFF949D9E)),
            ),
            TextSpan(
              text: ' ',
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xFF949D9E)),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
              text: 'تسجيل دخول',
              style:
                  TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
