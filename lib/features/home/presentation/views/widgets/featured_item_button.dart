import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 32,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('تسوق الان',
                  style: TextStyles.bold13.copyWith(
                    color: const Color(0xFF1B5E37),
                  )),
            ),
          ),
        ));
  }
}
