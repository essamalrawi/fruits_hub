import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_button.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(children: [
        Image.asset(Assets.imagesWatermelon),
        Container(
          child: const Column(
            children: [
              Text('عروض العيد', style: TextStyles.regular13),
              Text(
                'خصم 25%',
                style: TextStyles.bold19,
              ),
              FeaturedItemButton(),
            ],
          ),
        )
      ]),
    );
  }
}
