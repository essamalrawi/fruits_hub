import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            suffixIcon: SizedBox(
                width: 20,
                child:
                    Center(child: SvgPicture.asset(Assets.imagesSearchFilter))),
            prefixIcon: SizedBox(
                width: 20,
                child: Center(child: SvgPicture.asset(Assets.imagesSearch))),
            filled: true,
            fillColor: Colors.white,
            hintText: 'ابحث عن.......',
            hintStyle: TextStyles.regular13.copyWith(
              color: const Color(0xFF949D9E),
            ),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder()),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(
        4,
      ),
    );
  }
}
