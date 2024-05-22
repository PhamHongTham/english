import 'package:english/them/them_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.text1,
    this.text2,
    this.onTap,
  }) : super(key: key);

  final String? text1;
  final String? text2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text1,
          style: GoogleFonts.openSans(
              color: ColorSchemes.primaryColorScheme.onPrimary,
              fontSize: 14.0,
              fontWeight: FontWeight.w700),
          children: [
            TextSpan(
                text: text2,
                style: GoogleFonts.openSans(
                    color: ColorSchemes.primaryColorScheme.onSecondaryContainer,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
                recognizer: TapGestureRecognizer()..onTap = onTap),
          ],
        ),
      ),
    );
  }
}
