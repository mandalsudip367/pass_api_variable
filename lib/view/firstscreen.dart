import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization/view/secondscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: prefer_typing_uninitialized_variables
var dog;

class _MyHomePageState extends State<MyHomePage> {
  Future imagefromnetwork() async {
    final url = Uri.parse("https://dog.ceo/api/breeds/image/random");
    var res = await http.get(url);
    var image = jsonDecode(res.body);
    setState(() {
      dog = image['message'];
    });
  }

  @override
  void initState() {
    imagefromnetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Main Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(dog: dog),
                    ));
              },
              child: Text("Show Image"),
            ),
          )
        ],
      ),
    );
  }
}
