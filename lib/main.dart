import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/login_page.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        // initialRoute: "/home",
        routes: {
          "/": (context) => LoginPage(),  
          MyRoutes.homePage: (context) => const HomePage(),
          MyRoutes.loginPage: (context) => LoginPage()
        },
    );
  }
}
 