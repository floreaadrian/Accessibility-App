import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.grey[200],
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.grey[350],
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
    buttonColor: Colors.blue[800],
    textTheme: TextTheme(
        title: TextStyle(color: Colors.grey[700], fontFamily: 'Oswald'),
        body1: TextStyle(
          color: Colors.black,
          fontFamily: 'Oswald',
          fontSize: 30,
        )),
    iconTheme: IconThemeData(color: Colors.grey[700]));

var darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.grey[900],
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.grey[800],
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
    buttonColor: Colors.white,
    textTheme: TextTheme(
        title: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
        body1: TextStyle(
          color: Colors.white,
          fontFamily: 'Oswald',
          fontSize: 30,
        )),
    iconTheme: IconThemeData(color: Colors.white));
