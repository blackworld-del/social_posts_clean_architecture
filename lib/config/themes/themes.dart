import 'package:flutter/material.dart';


class AppTheme{
  static ThemeData darkTheme(){
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          
        ),
      ),
    );
  }
}