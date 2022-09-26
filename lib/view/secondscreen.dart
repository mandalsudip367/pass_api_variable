import 'package:flutter/material.dart';
import 'package:json_serialization/view/firstscreen.dart';

class SecondScreen extends StatefulWidget {
  var dog = '';
  SecondScreen({super.key, required this.dog});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: dog == null
                ? const Padding(
                    padding: EdgeInsets.all(80.0),
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(dog))),
                    // child: Image.network(dog)
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
