import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/theme.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
//import 'package:device_preview/device_preview.dart';

//wrapping in VxState helps us to manage state of app
void main() => runApp( VxState(store: MyStore(),
child: MyApp())
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
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,

      //ROUTES: {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },

      
    );
  }
}
