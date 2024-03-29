// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  MyTheme(Color canvasColor);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
     primaryColor: const Color.fromARGB(255, 0, 0, 0),  //primaryColor to manually specify colors
    //if texttheme default text color doesn't work out    
    primaryColorDark: const Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),            
    ),
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: creamColor,
    canvasColor: creamColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: const Color.fromARGB(255, 76, 46, 228)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 76, 46, 228))
    ),
     floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 76, 46, 228),
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),    
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    primaryColor: Colors.white,  //primaryColor/ accentColor to manually specify colors
    //if texttheme default text color doesn't work out    
    primaryColorDark: Colors.black,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white),            
    ),
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: const Color.fromARGB(255, 31, 35, 46),
    canvasColor: const Color.fromARGB(255, 34, 33, 33),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.lightBlue),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Colors.lightBlue)
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 31, 35, 46),
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),    
    ),
  );

  //COLORS:
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkColor = const Color.fromARGB(255, 34, 33, 33);
  static Color lightBlue = Colors.lightBlue;
  static Color darkBlue = const Color.fromARGB(255, 56, 56, 56);


}
