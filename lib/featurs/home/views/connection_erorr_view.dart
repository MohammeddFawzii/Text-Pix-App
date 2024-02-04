import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:text_pix/featurs/home/views/home_view.dart';


class ConnectionErorr extends StatelessWidget {
  const ConnectionErorr({super.key});
  static String id = "ConnectionErorr";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Check Your Connection And Reload !",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  bool connected =
                      await ConnectivityWrapper.instance.isConnected;
                  if (connected) {
                    Navigator.pushReplacementNamed(context, HomeView.id);
                  } else {}
                },
                child: const Text(
                  "Reload",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
