import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),    
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.lato().fontFamily, //whole app
        primaryTextTheme:
            GoogleFonts.latoTextTheme(), //only primary text of whole app
  );

  //COLORS:
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff403b58);


}
