import 'package:flutter/material.dart';
import 'package:yuyuid/shared/shared.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

// final ThemeData appThemeData = ThemeData(
//   primarySwatch: Colors.blue,
//   visualDensity: VisualDensity.adaptivePlatformDensity,
// );

class AppTheme {
  AppTheme._();
  static ThemeData appThemeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static const Color primarySwatch = Colors.blue;
  static const Color orange = Color.fromRGBO(255, 186, 84,1.000);
  static const Color  lightOrange = Color.fromRGBO(255, 201, 119,1.000);
  static const Color  thinOrange = Color.fromRGBO(255, 218, 163,1.000);

  static const Color yellow = Color.fromRGBO(255, 210, 84,1.000);
  static const Color lightYellow = Color.fromRGBO(255, 220, 119,1.000);
  static const Color thinYellow = Color.fromRGBO(255,231,163,1.000);

  static const Color danger = Color(0xFFE33C40);

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );


  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle HeadlineBgWhite = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize:24,
    letterSpacing: 0.50,
    color: white
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle headline2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize:22,
    letterSpacing: 0.30,
    color: darkerText
  );
  static const TextStyle headline3 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize:18,
    letterSpacing: 0.18,
    color: darkerText
  );
  static const TextStyle headline4 = TextStyle(
    fontFamily: fontName,
      color: darkerText,
      fontSize:16,
      fontWeight: FontWeight.bold
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

}