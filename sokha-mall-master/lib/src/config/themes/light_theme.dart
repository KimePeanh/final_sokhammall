import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';
// rgb(135, 131, 138)

ThemeData lightTheme = ThemeData(
    primaryTextTheme: TextTheme(
      headline1: GoogleFonts.roboto(
          fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.roboto(
          fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.roboto(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.roboto(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.roboto(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.roboto(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(
          fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.roboto(
          fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.roboto(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.roboto(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.roboto(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.roboto(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Color(0xFF00a652),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25),
            backgroundColor: Colors.grey[100],
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(standardBorderRadius)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            primary: tileColor,
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(standardBorderRadius)))),
    // primaryColor: Color.fromRGBO(135, 131, 138, 1),
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    buttonColor: Colors.grey[200],
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.white,
        textTheme: TextTheme(
            headline6: TextStyle(
          color: Colors.black,
        ))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      selectedLabelStyle: TextStyle(color: Colors.red),
      unselectedItemColor: Color.fromRGBO(158, 158, 158, 1),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey[500],
      ),
    ));
