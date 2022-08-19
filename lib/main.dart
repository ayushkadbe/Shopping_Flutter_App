import 'package:flutter/material.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/theme.dart';
import 'pages/home_page.dart';
//import 'package:device_preview/device_preview.dart';

void main() => runApp( MyApp()
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app for device preview
  // ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //preview
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      //THEME
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,

      //ROUTES: {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        //MyRoutes.productDetailsRoute: (context) => const ProductDetails(catalog: null,),
      },

      
    );
  }
}
