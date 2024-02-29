import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFFFB6D3A);
const Color onPrimaryColor = Color(0xFF9C9BA6);
const Color colorFill = Color(0xFFECF0F4);

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
