import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_fruits_view_body.dart';

import '../../../../core/widgets/build_app_bar.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const routeName = 'best_selling_fruits_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: const BestSellingFruitsViewBody(),
    );
  }
}
