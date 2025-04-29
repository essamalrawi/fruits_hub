import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
  });

  final String image, backgroundImage, subtitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
