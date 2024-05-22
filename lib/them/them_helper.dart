import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    background: Color(0XFF93DAFF),
    primary: Color(0xFF2E353A),
    secondary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF334272),
    secondaryContainer: Color(0xFF3D2C8D),
    onSecondary: Color(0xFFA9A297),
    onPrimary: Color(0xFF0F044C),
    outline: Color(0xFFE9E9E9),
    tertiary: Color(0xFF888888),
    onTertiary: Color(0xFF524E48),
    onSecondaryContainer: Color(0xFF4285F4),
    tertiaryContainer: Color(0xFFF9B208),
  );
}

class AppColor {
  AppColor._();
  static Color backgroundColor = const Color(0XFF0AB6AB);
  static Color primaryColor = const Color.fromARGB(255, 0, 148, 106);
  static LinearGradient linear = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      const Color(0xff918FF2).withOpacity(44.64 / 100),
      const Color(0xff918FF2),
    ],
  );
  static const Color green = Colors.green;
  static const Color cte = Color(0XFFF4F4F4);
  static const Color lightgreen = Color(0xFF167F71);
  static const Color blue = Colors.blue;
  static const Color primary = Color.fromARGB(255, 216, 154, 54);
  static const Color dark500 = Color(0xFF33495D);
  static const Color signInSignUp = Color(0xFF0046FB);
  static const Color search = Color(0xFF9A9A9A);
  static const Color divider = Color(0XFFD1D3D4);
  static const Color brown = Colors.brown;
  static const Color colourscheme = Color(0xFF535763);
  static const Color bgmain = Color(0xFFf1f1fb);
  static const Color orange = Colors.orange;
  static const Color bgColor = Color(0xFFEEEFF5);
  static const Color shadow = Colors.black26;
  static const Color buttonB = Color(0xFF4285F4);
  static const Color bgemail = Color(0xFFF9FAFB);
  static const Color bg = Color(0xFFF0F0F0);
  static const Color container = Color(0xFF167F71);
  static const Color container1 = Color(0xFFD8D8D8);
  static const Color container2 = Color(0xFFE5F5F5F8);
  static const Color text = Color(0xFF202244);
  static const Color bt = Color(0xFF0961F5);
  static const Color sw = Color(0xFFE8F1FF);
  static const Color bgcard = Color(0xFFF5F9FF);
  static Color sw1 = Color(0xFFEB4BDC4).withOpacity(0.5);
  static const Color sw2 = Color(0xFF0961F5);
  static LinearGradient linearBG = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xff0046FB),
      const Color(0xff0047FF).withOpacity(0),
    ],
  );
  static LinearGradient linearBT = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff468CE7),
      Color(0xff3957ED),
    ],
  );

  static LinearGradient avt = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffE2DAFD),
      Color(0xffD6CBFC),
    ],
  );
  static LinearGradient containerHome = const LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xffA9CBFF),
      Color(0xff458BE7),
    ],
  );
}

class AppStyle {
  static TextStyle textTitle = GoogleFonts.passeroOne(
    color: ColorSchemes.primaryColorScheme.tertiaryContainer,
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textSubtitle = GoogleFonts.openSans(
    color: ColorSchemes.primaryColorScheme.secondary,
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textWelcom = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.secondaryContainer,
      fontSize: 24.0,
      fontWeight: FontWeight.w700);

  static TextStyle textInput = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.onSecondary,
      fontSize: 18.0,
      fontWeight: FontWeight.w700);

  // ignore: non_constant_identifier_names
  static TextStyle textEmail_Password = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.onPrimary,
      fontSize: 14.0,
      fontWeight: FontWeight.w700);
  static TextStyle textFormField = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.tertiary,
      fontSize: 11.0,
      fontWeight: FontWeight.w700);

  static TextStyle textForgotPassword = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.onPrimary,
      fontSize: 12.0,
      fontWeight: FontWeight.w600);
  static TextStyle button = GoogleFonts.openSans(
    color: ColorSchemes.primaryColorScheme.secondary,
    fontSize: 19.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textbottom = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.onPrimary,
      fontSize: 14.0,
      fontWeight: FontWeight.w700);

  static TextStyle cate = GoogleFonts.openSans(
      color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400);
  static TextStyle titleOnboarding = GoogleFonts.passeroOne(
      color: ColorSchemes.primaryColorScheme.tertiaryContainer,
      fontSize: 64.0,
      fontWeight: FontWeight.w400);
  static TextStyle description = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.secondary,
      fontSize: 18.0,
      fontWeight: FontWeight.w700);

  static TextStyle subtitle = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.secondary,
      fontSize: 36.0,
      fontWeight: FontWeight.w700);
  static TextStyle signInSignUp = GoogleFonts.openSans(
      color: AppColor.signInSignUp,
      fontSize: 18.0,
      fontWeight: FontWeight.w400);

  static TextStyle titleSignInSignUp = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.secondary,
      fontSize: 24.0,
      fontWeight: FontWeight.w800);
  static TextStyle desSignInSignUp = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.secondary,
      fontSize: 18.0,
      fontWeight: FontWeight.w400);
  static TextStyle buttonB = GoogleFonts.openSans(
      color: ColorSchemes.primaryColorScheme.secondary,
      fontSize: 18.0,
      fontWeight: FontWeight.w400);

  static TextStyle containerText = GoogleFonts.prozaLibre(
      color: ColorSchemes.primaryColorScheme.secondary,
      fontSize: 36.0,
      fontWeight: FontWeight.w600,
      height: 1);

  static TextStyle search = GoogleFonts.openSans(
      color: AppColor.search,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      height: 1);

  static TextStyle colourscheme = GoogleFonts.titilliumWeb(
      color: AppColor.colourscheme,
      fontSize: 18.0,
      fontWeight: FontWeight.w800);

  static TextStyle text = GoogleFonts.mulish(
      color: AppColor.text, fontSize: 15.0, fontWeight: FontWeight.w700);

  static TextStyle title1 = GoogleFonts.jost(
      color: AppColor.text, fontSize: 20.0, fontWeight: FontWeight.w700);

  static TextStyle title = GoogleFonts.jost(
      color: AppColor.text, fontSize: 25.0, fontWeight: FontWeight.w700);
  static TextStyle text1 = GoogleFonts.mulish(
      color: AppColor.text, fontSize: 16.0, fontWeight: FontWeight.bold);
  static TextStyle card = GoogleFonts.mulish(
      color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w800);
  static TextStyle card1 = GoogleFonts.mulish(
      color: Colors.white, fontSize: 8.0, fontWeight: FontWeight.w800);
  static TextStyle card2 = GoogleFonts.mulish(
      color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w700);
  static TextStyle card3 = GoogleFonts.mulish(
      color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w800);

  static TextStyle textStyle = GoogleFonts.mulish(
      color: AppColor.lightgreen, fontSize: 14.0, fontWeight: FontWeight.w800);
}
