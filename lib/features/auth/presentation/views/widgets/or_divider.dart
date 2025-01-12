import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFDCDEDE),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text('أو', style: TextStyles.semiBold16),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFDCDEDE),
          ),
        )
      ],
    );
  }
}
