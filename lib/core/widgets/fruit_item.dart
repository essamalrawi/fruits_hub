import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import '../utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(children: [
        Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border))),
        Positioned.fill(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Image.asset(
                Assets.imagesWatermelon,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: Text('بطيخ',
                  textAlign: TextAlign.right,
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF0C0D0D),
                  )),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '20جنية ',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.secondPrimaryColor,
                        )),
                    TextSpan(
                      text: '/',
                      style: TextStyles.bold13.copyWith(
                        color: AppColors.secondPrimaryColor,
                      ),
                    ),
                    TextSpan(
                      text: ' الكيلو',
                      style: TextStyles.semiBold13
                          .copyWith(color: AppColors.secondPrimaryColor),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
              trailing: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
