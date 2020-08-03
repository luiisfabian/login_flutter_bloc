import 'package:flutter/material.dart';
import 'package:login_flutter_bloc/src/bloc/provider.dart';
import 'package:login_flutter_bloc/src/pages/home_page.dart';
import 'package:login_flutter_bloc/src/pages/login_page.dart';
import 'package:login_flutter_bloc/src/pages/producto_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      key: key,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Flutter',
        initialRoute: "home",
        routes: {
          "login": (BuildContext context) => LoginPage(),
          "home": (BuildContext context) => HomePage(),
          "producto": (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.green
        ),
      ),
    );
  }
}
