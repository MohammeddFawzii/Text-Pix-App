// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:text_pix/core/utils/erorr_dialog.dart';
import 'package:text_pix/featurs/home/views/generated_image_view.dart';

Future<dynamic> convertTextToImage(
  String style,
  String prompt,
  BuildContext context,
) async {
  Uint8List imageData = Uint8List(0);

  const baseUrl = 'https://api.stability.ai';
  final url = Uri.parse(
      '$baseUrl/v1/generation/stable-diffusion-v1-6/text-to-image');

  // Make the HTTP POST request to the Stability Platform API
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          //add ypur secreat key here
          'Bearer sk-xnuEzqfNGlSKsN7a8jXbbwkCzNPrlz80cX7XqMSKmcnMjfik',
      'Accept': 'image/png',
    },
    body: jsonEncode({
      'cfg_scale': 25,
      'clip_guidance_preset': 'FAST_BLUE',
      'height': 512,
      'width': 512,
      'samples': 1,
      'steps': 50,
      'seed': 0,
      'style_preset': style,
      'text_prompts': [
        {
          'text': prompt,
          'weight': 1,
        }
      ],
    }),
  );
  log(response.statusCode.toString());

  if (response.statusCode == 200) {
    try {
      imageData = (response.bodyBytes);
      log(style);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GeneratedImageView(image: imageData),
          ));
      return response.bodyBytes;
    } catch (e) {
      log(e.toString());
      return showErrorDialog("erorr ${e.toString()}", context);
    }
  } else {
    return showErrorDialog("erorr ${response.statusCode.toString()}", context);
  }
}
