import 'dart:developer';

import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:text_pix/core/app_images.dart';
import '../../../core/utils/api_services.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> strings = [
    '3d-model',
    'anime',
    'cinematic',
    'digital-art',
    'line-art',
    'photographic',
    'pixel-art',
  ];
  String selectedString = "";

  @override
  void initState() {
    super.initState();
    selectedString = strings[0];
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
            width: screenWidth * 0.15, child: Image.asset(AppImages.appPLogo)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.black, width: 2))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Type what is in your imagination ... ",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a value';
                    } else {
                      return null;
                    }
                  },
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Enter your prompt',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Select Your Style .."),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: strings.map((String string) {
                  return RadioListTile(
                    title: Text(string),
                    value: string,
                    groupValue: selectedString,
                    onChanged: (value) {
                      setState(() {
                        selectedString = value.toString();
                        log(selectedString);
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool connected =
                        await ConnectivityWrapper.instance.isConnected;

                    if (connected) {
                      convertTextToImage(
                          selectedString, textController.text, context);
                      isLoading = true;
                      setState(() {});
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Connection Erorr',
                              style: TextStyle(color: Colors.red),
                            ),
                            content:
                                const Text("Check Your Internet Connection !"),
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

                      setState(() {});
                    }
                  }
                },
                child: isLoading
                    ? const SizedBox(
                        width: 50,
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                          backgroundColor: Colors.black,
                        ),
                      )
                    : const Text(
                        "Generate image ",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
