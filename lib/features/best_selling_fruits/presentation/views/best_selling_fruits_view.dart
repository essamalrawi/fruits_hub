import 'package:flutter/material.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_fruits_view_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const routeName = 'best_selling_fruits_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BestSellingFruitsViewBody(),
    );
  }
}
