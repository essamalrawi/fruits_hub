import 'package:flutter/material.dart';
import '../../../../../constants/assets.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Image.asset(Assets.imagesWatermelonTest),
          Container(
            child: Column(
              children: [
                Text(
                  'عروض العيد',
                  style: TextStyles.regular13.copyWith(
                    height: 1.60,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'خصم 25%',
                  style: TextStyles.bold19.copyWith(color: Colors.white),
                ),
                FeaturedItemButton(onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
