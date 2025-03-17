import 'package:flutter/material.dart';
import 'package:test_app/main2.dart'; // Assuming this is needed for MyAppBar and MyDrawer

void main() {
  runApp(
    Practice8(loadFromNetwork: true),
  ); // Pass true or false based on what you want
}

class Practice8 extends StatelessWidget {
  final bool loadFromNetwork;
  Practice8({required this.loadFromNetwork});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(title: "Image Example"),
        drawer: MyDrawer(),
        body: Center(
          child:
              loadFromNetwork
                  ? Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSymIX9nnyHCZoUUNG_ZTfxZOSa6GfqGgQDgg&s', // Network image URL
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                  : Image.asset(
                    'assets/img1.jpg', // Asset image path
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
        ),
      ),
    );
  }
}
