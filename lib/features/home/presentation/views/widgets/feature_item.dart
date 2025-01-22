import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_button.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(children: [
            Positioned(
                right: itemWidth * .4,
                left: 0,
                bottom: 0,
                top: 0,
                child: Image.asset(Assets.imagesWatermelon, fit: BoxFit.fill)),
            Container(
              width: itemWidth * .5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: Svg(Assets.imagesFeaturedItemBackground),
              )),
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text('عروض العيد',
                        style:
                            TextStyles.regular13.copyWith(color: Colors.white)),
                    const SizedBox(
                      height: 8,
                    ),
                    const Spacer(),
                    Text(
                      'خصم 25%',
                      style: TextStyles.bold19.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const FeaturedItemButton(),
                    const SizedBox(
                      height: 28,
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
