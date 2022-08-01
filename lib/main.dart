import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/routes.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app for device preview
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //preview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      //THEME
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        //
        fontFamily: GoogleFonts.lato().fontFamily, //whole app
        primaryTextTheme:
            GoogleFonts.latoTextTheme(), //only primary text of whole app
      ),
      debugShowCheckedModeBanner: false,

      //ROUTES: {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },

      
    );
  }
}
