import 'package:bets_app/models/constans.dart';
import 'package:bets_app/models/screen_utils.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Utils.kPrimaryColor,
        shape: const StadiumBorder(),
        maximumSize: const Size(double.infinity, 56),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white24,
      elevation: 0,
      // ignore: deprecated_member_use
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      // ignore: deprecated_member_use
      textTheme: TextTheme(
          headline6: TextStyle(
        color: Color.fromARGB(255, 2, 2, 2),
        fontSize: 18,
      )));
}
