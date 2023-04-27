import 'package:flutter/material.dart';
import 'auth_screen.dart';

import 'constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white38,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(
            vertical: defpaultPadding * 1.2, horizontal: defpaultPadding),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}