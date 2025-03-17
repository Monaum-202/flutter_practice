import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SnackBarCustomExample());
  }
}

class SnackBarCustomExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom SnackBar Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show customized SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Operation successful!'),
                  ],
                ),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                action: SnackBarAction(
                  label: 'Dismiss',
                  textColor: Colors.white,
                  onPressed: () {
                    print('Dismiss action');
                  },
                ),
              ),
            );
          },
          child: Text("Show Custom SnackBar"),
        ),
      ),
    );
  }
}
