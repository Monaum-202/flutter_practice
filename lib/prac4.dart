/*
Widget	Description
Text	Displays a simple text string.
Image	Displays an image from assets, network, or file.
Icon	Displays an icon.
*/

import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp6());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Basic Widgets")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, Flutter!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network("https://picsum.photos/200"),
            SizedBox(height: 20),
            Icon(Icons.favorite, color: Colors.red, size: 40),
          ],
        ),
      ),
    );
  }
}

/*
Widget	Description
Row	Arranges widgets horizontally.
Column	Arranges widgets vertically.
Stack	Overlays widgets on top of each other.
Container	A customizable box with padding, margin, and decoration.
*/

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Layout Widgets")),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              child: Text(
                "This is a Container",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(" Row Widget"),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 100, height: 100, color: Colors.green),
                Text("Stacked!", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
Widget	Description
TextField	Input field for entering text.
ElevatedButton	A button that reacts to taps.
Checkbox	A tick box for selection.
Switch	A toggle switch.

*/

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InputScreen());
  }
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  bool _isChecked = false;
  bool _isSwitched = false;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Widgets")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter your name"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Hello, ${_controller.text}!");
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text("Check this"),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
                Text("Toggle this"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
4. List and Grid Widgets
These are used to display lists and grids.

Widget	Description
ListView	Displays a scrollable list.
GridView	Displays a scrollable grid.
 */

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListScreen());
  }
}

class ListScreen extends StatelessWidget {
  final List<String> items = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Elderberry",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Example")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            leading: Icon(Icons.fiber_manual_record),
          );
        },
      ),
    );
  }
}

/*
5. Navigation Widgets
Used for moving between screens.

Widget	Description
Navigator	Manages app navigation.
Drawer	A slide-out side menu.
BottomNavigationBar	A bar at the bottom for navigation.
 */

class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Text("Go to Second Screen"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Go Back"),
        ),
      ),
    );
  }
}

/*
1. Showing an AlertDialog   
 */
void main() {
  runApp(MyApp6());
}

class MyApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen6());
  }
}

class HomeScreen6 extends StatelessWidget {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("This is an example of an AlertDialog."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertDialog Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showDialog(context),
          child: Text("Show AlertDialog"),
        ),
      ),
    );
  }
}

/*
2. Showing a SimpleDialog
 */

class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen7());
  }
}

class HomeScreen7 extends StatelessWidget {
  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Choose an option"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                print("Option 1 selected");
              },
              child: Text("Option 1"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                print("Option 2 selected");
              },
              child: Text("Option 2"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SimpleDialog Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSimpleDialog(context),
          child: Text("Show SimpleDialog"),
        ),
      ),
    );
  }
}

/*
3. Showing a Custom Popup (Custom Dialog)
 */

class MyApp8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen8());
  }
}

class HomeScreen8 extends StatelessWidget {
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Custom Popup",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("This is a custom popup with a rounded corner!"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Dialog Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showCustomDialog(context),
          child: Text("Show Custom Dialog"),
        ),
      ),
    );
  }
}

/*
4. Showing a Bottom Sheet

*/

class MyApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen9());
  }
}

class HomeScreen9 extends StatelessWidget {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "This is a Bottom Sheet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                child: Text("Close Bottom Sheet"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Sheet Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: Text("Show Bottom Sheet"),
        ),
      ),
    );
  }
}
