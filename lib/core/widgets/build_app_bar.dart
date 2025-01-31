import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/notfication_widget.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.bold19.copyWith(
          color: const Color(0xFF0C0D0D),
        ),
      ));
}
