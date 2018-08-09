import 'package:flutter/material.dart';
import 'utils/ThemeFactory.dart';
import 'containers/Home/home.dart';
import 'containers/login.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Clingme Flutter',
      theme: ThemeFactory.getMainTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }
}