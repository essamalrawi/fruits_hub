import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new)),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
