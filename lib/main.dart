import 'package:flutter/material.dart';
import 'package:login_flutter_bloc/src/pages/home_page.dart';
import 'package:login_flutter_bloc/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Flutter',
      initialRoute: "login",
      routes: {
        "login": (BuildContext context) => LoginPage(),
        "home": (BuildContext context) => HomePage(),
      },
    );
  }
}