import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController();
  String _userName = "";
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Load saved preferences (data)
  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  // Save user preferences (data)
  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _nameController.text);
    await prefs.setBool('isLoggedIn', true);
    _loadPreferences(); // Load the new data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferences Example")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_isLoggedIn)
              Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Enter your name"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _savePreferences,
                    child: Text("Login"),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Text("Welcome, $_userName!", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.clear(); // Clear all data
                      _loadPreferences(); // Reload data after clearing
                    },
                    child: Text("Logout"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}


/*
SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('key', 'value');  // For strings
await prefs.setInt('key', 123);         // For integers
await prefs.setBool('key', true);       // For booleans
await prefs.setDouble('key', 45.67);   // For doubles
Retrieving Data:


SharedPreferences prefs = await SharedPreferences.getInstance();
String? name = prefs.getString('key');
int? number = prefs.getInt('key');
bool? isLoggedIn = prefs.getBool('key');
double? price = prefs.getDouble('key');
Clearing Data:


SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.clear();
*/