import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days =30;
    String name = "Shubham";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      drawer: const Drawer(),
      body: Center(
          child: Text('welcome to $days days of code by $name')
      )
    );
  }
}