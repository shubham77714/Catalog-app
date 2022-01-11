import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) =>
    ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.lato().fontFamily,
      canvasColor: Colors.brown.shade100,
      cardColor: creamColor,
      highlightColor: darkBluishColor,
      primaryColor: darkBluishColor,
      primaryColorLight: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
      ),
    );  

  static ThemeData darkTheme (BuildContext context) =>
    ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.lato().fontFamily,
      canvasColor: lightGrey,
      cardColor: Colors.black,
      highlightColor: lightBluish,
      primaryColor: creamColor,
      primaryColorLight: Colors.white60,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.white54,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
      ),
    );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color lightGrey = Vx.gray800;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluish = Colors.indigo.shade400;
}