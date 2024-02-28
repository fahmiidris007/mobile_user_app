import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Sen',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  );
}
