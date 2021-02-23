import 'package:flutter/material.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/log_in_screen.dart';
import 'package:flutter_app/main_screen.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Pets'),
      // home: LogInScreen(title: 'Pets'),
      home: MainScreen(title: 'Pets'),
    );
  }
}