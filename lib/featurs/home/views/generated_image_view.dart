import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_pix/core/app_images.dart';
import 'package:text_pix/featurs/home/views/home_view.dart';
import 'dart:typed_data';

class GeneratedImageView extends StatefulWidget {
  final Uint8List image;

  const GeneratedImageView({super.key, required this.image});

  @override
  State<GeneratedImageView> createState() => _GeneratedImageViewState();
}

class _GeneratedImageViewState extends State<GeneratedImageView> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: const [],
        centerTitle: true,
        title: SizedBox(
            width: screenWidth * 0.15, child: Image.asset(AppImages.appPLogo)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.memory(
                widget.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeView.id);
                  },
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Image Saved ',
                            style: TextStyle(color: Colors.green),
                          ),
                          content: const Text("Successfully"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.download,
                    color: Colors.white,
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
