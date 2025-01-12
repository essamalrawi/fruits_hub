import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffexIcon});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffexIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
          suffixIcon: suffexIcon,
          filled: true,
          fillColor: const Color(0xFFF9FAFA),
          hintText: hintText,
          hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
      borderRadius: BorderRadius.circular(
        4,
      ),
    );
  }
}
