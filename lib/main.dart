import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/login_page.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme,
        initialRoute: MyRoutes.homePage,
        routes: {
          "/": (context) => const LoginPage(),  
          MyRoutes.homePage: (context) => const HomePage(),
          MyRoutes.loginPage: (context) => const LoginPage(),
        },
    );
  }
}
 