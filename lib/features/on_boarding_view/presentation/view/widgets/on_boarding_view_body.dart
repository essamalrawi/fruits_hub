import 'package:flutter/material.dart';
import 'package:fruits_hub/features/on_boarding_view/presentation/view/widgets/on_boarding_page_view_body.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(child: OnBoardingPageViewBody())]);
  }
}
