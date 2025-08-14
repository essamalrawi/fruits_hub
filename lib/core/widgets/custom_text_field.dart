import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.keyboardType,
    this.icon,
  });

  final Widget? icon;
  final TextInputType keyboardType;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: icon,
        hint: Text(
          hint,
          style: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        ),
        filled: true,
        fillColor: const Color(0xfff9fafa),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xffE6E9E9), width: 1),
    );
  }
}
