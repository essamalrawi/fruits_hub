import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});
  final String image, title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 56,
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1,
                      color: Color(
                        0xFFDCDEDE,
                      )),
                  borderRadius: BorderRadius.circular(16))),
          onPressed: () {
            onPressed;
          },
          child: ListTile(
            visualDensity:
                const VisualDensity(vertical: VisualDensity.minimumDensity),
            leading: SvgPicture.asset(image),
            title: Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xFF0C0D0D)),
            ),
          ),
        ));
  }
}
