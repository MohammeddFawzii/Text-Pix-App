import 'package:flutter/material.dart';
import 'package:text_pix/featurs/home/views/connection_erorr_view.dart';
import 'package:text_pix/featurs/home/views/home_view.dart';
import 'package:text_pix/featurs/splash%20Screen/views/splash_view.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  SplashView.id: (context) => const SplashView(),
  HomeView.id: (context) => const HomeView(),
  ConnectionErorr.id: (context) => const ConnectionErorr(),
};
