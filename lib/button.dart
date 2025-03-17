import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Button Examples")),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ElevatedButton Example
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    print("ElevatedButton pressed!");
                  },
                  child: Text("ElevatedButton"),
                ),
              ),
              // TextButton Example
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    print("TextButton pressed!");
                  },
                  child: Text("TextButton"),
                ),
              ),
              // OutlinedButton Example
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    print("OutlinedButton pressed!");
                  },
                  child: Text("OutlinedButton"),
                ),
              ),
              // IconButton Example
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print("IconButton pressed!");
                  },
                ),
              ),
              // FloatingActionButton Example
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    print("FloatingActionButton pressed!");
                  },
                  child: Icon(Icons.add),
                ),
              ),
              // MaterialButton Example
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: const Color.fromARGB(255, 170, 213, 249),
                  onPressed: () {
                    print("MaterialButton pressed!");
                  },
                  child: Text(
                    "MaterialButton",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB in AppBar pressed!");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
