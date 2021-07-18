import 'package:flutter/material.dart';
import 'package:miniproject1/LoginPage.dart';
import 'package:miniproject1/SignIn_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginPage(),
        ),
      );
  }
}
