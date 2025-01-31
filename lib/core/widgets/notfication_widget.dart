import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg_flutter.dart';

Container NotificationWidget() {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: const ShapeDecoration(
      color: Color(0xFFEEF8ED),
      shape: OvalBorder(),
    ),
    child: SvgPicture.asset(Assets.imagesNotification),
  );
}
