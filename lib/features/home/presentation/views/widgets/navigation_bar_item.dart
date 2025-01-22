import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/in_active_item.dart';

import '../../../domain/entites/bottom_navigation_bar_entity.dart';
import 'active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key, required this.isSelected, required this.entity});
  final bool isSelected;
  final BottomNavigationBarEntity entity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            text: entity.name,
            image: entity.activeImage,
          )
        : InActiveItem(
            image: entity.inActiveImage,
          );
  }
}
