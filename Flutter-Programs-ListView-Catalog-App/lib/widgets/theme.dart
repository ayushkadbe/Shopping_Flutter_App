import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: creamColor,
    canvasColor: creamColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Color.fromARGB(255, 76, 46, 228)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 76, 46, 228))
    ),
     floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 76, 46, 228),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),    
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: darkColor,
    canvasColor: darkColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.lightBlue),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Colors.lightBlue)
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.lightBlue,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),    
    ),
  );

  //COLORS:
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkColor = Color.fromARGB(0, 44, 43, 43);
  static Color lightBlue = Colors.lightBlue;
  static Color darkBlue = Color.fromARGB(0, 0, 47, 255);


}
