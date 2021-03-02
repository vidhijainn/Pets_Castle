import 'package:flutter/material.dart';

import 'user/main_screen.dart';
import 'package:flutter_app/pages/doctor/home.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MainScreen(title: 'Pets'),
      home: Home(title: 'Pets'),
    );
  }
}