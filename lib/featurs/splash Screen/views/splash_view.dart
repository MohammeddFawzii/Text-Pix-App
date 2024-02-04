import 'package:flutter/material.dart';
import 'package:text_pix/featurs/splash%20Screen/functions/delay_and_navigate.dart';
import 'package:text_pix/featurs/splash%20Screen/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = " SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayAndNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SplashViewBody(screenWidth: screenWidth);
  }
}
