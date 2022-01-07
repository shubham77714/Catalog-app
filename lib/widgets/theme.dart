import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData get lightTheme =>
    ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )
          ),
        );  

  static ThemeData get darkTheme =>
    ThemeData(brightness: Brightness.dark);
}