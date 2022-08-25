// ignore: duplicate_ignore
// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/product_details_page.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/theme.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';
// ignore: import_of_legacy_library_into_null_safe, depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';
//import 'package:device_preview/device_preview.dart';

//wrapping in VxState helps us to manage state of app
void main(){ 
  Vx.setPathUrlStrategy();
  runApp( VxState(store: MyStore(),
child: const MyApp())
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app for device preview
  // ),
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //preview
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      //THEME
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,

      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
          "/": (_,__) => const MaterialPage(child: LoginPage()),
        MyRoutes.homeRoute: (_,__) => const MaterialPage(child: HomePage()),
        // MyRoutes.productDetailsRoute: (uri, _) {
        //   final catalog = (VxState.store as MyStore).catalog.getById(int.parse(Uri.queryParameters["id"]));
        //   return MaterialPage(child: ProductDetails(catalog: catalog));
        // }, 
        //ABOVE IS FOR product Id in URL, but it's giving some error
        MyRoutes.loginRoute: (_,__) => const MaterialPage(child: LoginPage()),
        MyRoutes.cartRoute: (_,__) => const MaterialPage(child: CartPage()),

      }),

      //ROUTES: {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}
      // initialRoute: MyRoutes.homeRoute,
      // routes: {
        // "/": (context) => const LoginPage(),
        // MyRoutes.homeRoute: (context) => const HomePage(),
        // MyRoutes.loginRoute: (context) => const LoginPage(),
        // MyRoutes.cartRoute: (context) => const CartPage(),
      //},

      
    );
  }
}
