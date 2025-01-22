import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../best_selling_fruits/presentation/views/best_selling_fruits_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, BestSellingFruitsView.routeName),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: TextStyles.bold16.copyWith(
              color: const Color(0xFF0C0D0D),
            ),
          ),
          Text('المزيد',
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF949D9E),
              )),
        ],
      ),
    );
  }
}
