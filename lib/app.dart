import 'package:flutter/material.dart';
import 'package:flutter_hello_world/containers/home/home.dart';
import 'containers/login.dart';
import 'utils/ThemeFactory.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Clingme Flutter',
      theme: ThemeFactory.getMainTheme(),
      home: Home(),
    );
  }
}