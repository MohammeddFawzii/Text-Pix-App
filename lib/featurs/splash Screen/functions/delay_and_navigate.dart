import 'package:flutter/material.dart';
import 'package:text_pix/featurs/home/views/connection_erorr_view.dart';
import '../../home/views/home_view.dart';
import 'package:connectivity_checker/connectivity_checker.dart';

void delayAndNavigate(BuildContext context) {
  Future.delayed(const Duration(seconds: 3)).then((value) async {
    await checkConnectionAndNavigat(context);
  });
}

Future<void> checkConnectionAndNavigat(BuildContext context) async {
    bool connected = await ConnectivityWrapper.instance.isConnected;
  if (connected) {
    Navigator.pushReplacementNamed(context, HomeView.id);
  } else if (!connected) {
    Navigator.pushReplacementNamed(context, ConnectionErorr.id);
  } else {}
}


