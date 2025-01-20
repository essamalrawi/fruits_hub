import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 54,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text('تسوق الان',
              style: TextStyles.bold13.copyWith(
                color: const Color(0xFF1B5E37),
              )),
        ));
  }
}
