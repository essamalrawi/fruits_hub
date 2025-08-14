import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟',
            style: TextStyles.bold16.copyWith(color: const Color(0xFF949D9E)),
          ),

          const TextSpan(text: ' ', style: TextStyles.bold16),
          TextSpan(
            text: 'قم بإنشاء حساب',
            style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
