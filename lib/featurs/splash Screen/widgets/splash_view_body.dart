import 'package:flutter/material.dart';
import 'package:text_pix/core/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: SizedBox(
                width: widget.screenWidth * 0.5,
                child: Image.asset(AppImages.appPLogo)),
          ),
          const Text(
            "TextPix",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "FORTE",
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: widget.screenWidth * 0.9,
            height: 10,
            child: const LinearProgressIndicator(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              backgroundColor: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Creativity unleashed with AI image generation!",
            style: TextStyle(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
