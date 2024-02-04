import 'package:flutter/material.dart';
import 'package:text_pix/core/app_routes.dart';
import 'package:text_pix/featurs/splash%20Screen/views/splash_view.dart';

void main() {
  //Image Generator App
  runApp(const TextPixApp());
}

class TextPixApp extends StatelessWidget {
  const TextPixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TextPix ",
      routes: appRoutes,
      initialRoute: SplashView.id,
    );
  }
}
