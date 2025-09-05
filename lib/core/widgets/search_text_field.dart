  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';
import '../utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
    const SearchTextField({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: SizedBox(
                width: 20,
                child: Center(child: SvgPicture.asset(Assets.imagesSearchIcon))),
            suffixIcon: SizedBox(
                width: 20,
                child: Center(child: SvgPicture.asset(Assets.imagesFilter))),
            hintStyle: TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
            hintText: 'ابحث عن.........',
            filled: true,
            fillColor: const Color(0xFFFFFFFF),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
        ),

        decoration: const BoxDecoration( boxShadow:  [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ], ),
      );
    }

    OutlineInputBorder buildBorder() {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: Color(0xFFFFFFFF)),
      );
    }
  }
