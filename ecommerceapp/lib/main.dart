import 'package:ecommerceapp/SplashScree/splashscreen.dart';
import 'package:ecommerceapp/conts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'conts/styles.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: darkFontGrey
            ),
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const splashScreen(),
    );
  }
}

