import 'package:flutter/material.dart';
import 'package:test_app/page2.dart';
import 'package:test_app/page1.dart';
import 'package:test_app/page3.dart';
import 'package:test_app/test.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      // home: Practice3(),
      initialRoute: "/p1",
      routes: {
        "/p1": (context) => Practice1(),
        "/p2": (context) => Practice2(),
        "/p3": (context) => Practice3(),
        "/p4": (context) => HomePage(),
        "/p5": (context) => Practice9(),
      },
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar({required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleSpacing: 10,
      toolbarHeight: 60,
      toolbarOpacity: 1,
      elevation: 10,
      backgroundColor: Colors.blueAccent,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/p1');
          },
          icon: Icon(Icons.accessible),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/p2');
          },
          icon: Icon(Icons.dangerous_sharp),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/p3');
          },
          icon: Icon(Icons.back_hand),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/p4');
          },
          icon: Icon(Icons.home),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/p5');
          },
          icon: Icon(Icons.home),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Mr. Hello'),
            accountEmail: Text('Hello@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/img1.jpg', // Path to your image
                  width: 80.0, // You can adjust the size
                  height: 80.0, // You can adjust the size
                  fit: BoxFit.cover, // To ensure the image is nicely fitted
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.looks_one),
            title: Text('Practice 1'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              // Navigator.pop(context); // Close the drawer
              Navigator.pushReplacementNamed(
                context,
                '/p1',
              ); // Navigate to Practice1
            },
          ),
          ListTile(
            leading: Icon(Icons.looks_two),
            title: Text('Practice 2'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacementNamed(
                context,
                '/p2',
              ); // Navigate to Practice2
            },
          ),
          ListTile(
            leading: Icon(Icons.looks_3),
            title: Text('Practice 3'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Practice3()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Practice1 extends StatelessWidget {
  const Practice1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Practice 1"),
      body: Center(
        child: Container(
          height: double.infinity,
          width: 200.00,
          color: const Color.fromARGB(255, 158, 200, 235),
          child: Center(
            child: Text(
              "Hello",
              style: TextStyle(
                fontSize: 40,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class Practice2 extends StatelessWidget {
  const Practice2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Practice 2"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50.0,
              width: double.infinity,
              color: Colors.blueAccent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "To create some space on the right side of your icons in the AppBar in Flutter, you can adjust the actions list and add a SizedBox with a specified width or use a Padding widget to create the desired space.Here's an updated version of your code where I added a SizedBox to introduce space between the icons:",
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              color: Colors.redAccent,
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              color: Colors.green,
            ),
            Text(
              "Hello",
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                print("object");
              },
              icon: Icon(Icons.add_to_drive),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class Practice3 extends StatelessWidget {
  const Practice3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Practice 3"),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 300.0,
              color: Colors.blueAccent,
            ),

            Container(
              width: 300.0,
              height: double.infinity,
              color: Colors.redAccent,
            ),
            Container(
              width: 300.0,
              height: double.infinity,
              color: Colors.green,
            ),
            Container(
              height: double.infinity,
              width: 300.0,
              color: Colors.blueAccent,
            ),

            Container(
              width: 300.0,
              height: double.infinity,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class Practice4 extends StatelessWidget {
  const Practice4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Practice 4"),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(height: double.infinity, color: Colors.blueAccent),
          ),
          Expanded(
            flex: 2,
            child: Container(height: double.infinity, color: Colors.redAccent),
          ),
          Expanded(
            flex: 1,
            child: Container(height: double.infinity, color: Colors.green),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

class Practice5 extends StatelessWidget {
  const Practice5({super.key});

  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amberAccent,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.cyan,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.teal,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.amberAccent,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.cyan,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.teal,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.amberAccent,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.cyan,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              color: Colors.teal,
              height: 100.0,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   color: const Color.fromARGB(255, 205, 152, 72),
              //   borderRadius: BorderRadius.circular(
              //     20.0,
              //   ), // Higher value for more rounding
              // ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              color: const Color.fromARGB(255, 241, 201, 188),
              height: 100.0,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hello",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          print("object");
                        },
                        icon: Icon(Icons.add_to_drive),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print("object");
                      },
                      icon: Icon(Icons.abc_rounded),
                    ),
                    IconButton(
                      onPressed: () {
                        print("object");
                      },
                      icon: Icon(Icons.access_alarm_sharp),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.lightGreenAccent,
              height: 100.0,
              width: double.infinity,
            ),
            Container(
              color: Colors.purpleAccent,
              height: 100.0,
              width: double.infinity,
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class Practice7 extends StatelessWidget {
  const Practice7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Practice 7"),
      body: Column(
        children: [
          Expanded(
            //Expanded weget must be a chid of column or row
            flex: 2, //Take double space then other w
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.redAccent,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

class Practice8 extends StatelessWidget {
  final bool loadFromNetwork;
  Practice8({required this.loadFromNetwork});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Image Example"),
      drawer: MyDrawer(),
      body: Center(
        child:
            loadFromNetwork
                ? Image.network(
                  'https://example.com/my_image.png', // Network image URL
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
    );
  }
}

class Practice9 extends StatelessWidget {
  const Practice9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ignore: avoid_print
            print("You press me");
            // MySnackBar("Click Me!!!", context);
          },
          child: Row(
            children: [
              const Text(
                "Click Me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.account_balance_sharp),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Home Page"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Image and Title
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp",
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome to MyApp",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Quick Actions Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _QuickAction(
                    icon: Icons.home,
                    label: "Home",
                    color: Colors.blue,
                  ),
                  _QuickAction(
                    icon: Icons.favorite,
                    label: "Favorites",
                    color: Colors.red,
                  ),
                  _QuickAction(
                    icon: Icons.notifications,
                    label: "Alerts",
                    color: Colors.orange,
                  ),
                  _QuickAction(
                    icon: Icons.settings,
                    label: "Settings",
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Content Section with Images
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // First Row
                  Row(
                    children: [
                      Flexible(
                        child: _ImageItem(
                          imageUrl:
                              "https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp",
                          label: "Item 1",
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: _ImageItem(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlrZqTCInyg6RfYC7Ape20o-EWP1EN_A8fOA&s",
                          label: "Item 2",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Second Row
                  Row(
                    children: [
                      Flexible(
                        child: _ImageItem(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlrZqTCInyg6RfYC7Ape20o-EWP1EN_A8fOA&s",
                          label: "Item 3",
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: _ImageItem(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlrZqTCInyg6RfYC7Ape20o-EWP1EN_A8fOA&s",
                          label: "Item 4",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Footer Section with Button
            ElevatedButton(
              onPressed: () {
                // Handle Button Click
              },
              child: Text("Explore More"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Quick Action Widget (Reusable for Icons)
class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  _QuickAction({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("$label clicked");
      },
      child: Column(
        children: [Icon(icon, size: 40, color: color), Text(label)],
      ),
    );
  }
}

// Image Item Widget (Reusable)
class _ImageItem extends StatelessWidget {
  final String imageUrl;
  final String label;

  _ImageItem({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      // home: prictice1(),
      initialRoute: "/p1",
      //  initialRoute: (token != null && JwtDecoder.isExpired(token) == false )?"/dash":"/login",
      routes: {
        "/p1": (context) => Page1(),
        "/p2": (context) => Page2(),
        "/p3": (context) => Page3(),
        "/login": (context) => LoginScreen(),
        // MainScreen.idScreen: (context) => MainScreen(),
        // ListPage.idScreen: (context) => ListPage(),
      },
    );
  }
}

class BTNavigation extends StatefulWidget {
  const BTNavigation({super.key});

  @override
  State<BTNavigation> createState() => _BTNavigationState();
}

class _BTNavigationState extends State<BTNavigation> {
  var _currentState = 0;
  final pages = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        titleSpacing: 2,
        // centerTitle: true,
        toolbarHeight: 60,
        //Defoult height 60
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 51, 71, 88),
        actions: [
          IconButton(
            onPressed: () {
              // MySnackBar("1nd Button", context);
              // print("aaaa");
            },
            icon: Icon(Icons.account_balance),
          ),
          IconButton(
            onPressed: () {
              // MySnackBar("2nd Button", context);
              // print("accessibility");
            },
            icon: Icon(Icons.accessibility),
          ),
          IconButton(
            onPressed: () {
              // MySnackBar("3nd Button", context);
            },
            icon: Icon(Icons.accessible_forward),
          ),
          IconButton(
            onPressed: () {
              // MySnackBar("4nd Button", context);
            },
            icon: Icon(Icons.account_balance_wallet),
          ),
          IconButton(
            onPressed: () {
              // MySnackBar("4nd Button", context);
            },
            icon: Icon(Icons.add_to_drive),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        currentIndex: _currentState,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Color.fromARGB(87, 204, 175, 44),
            label: "Message",
            icon: Icon(Icons.account_box_outlined),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(5, 147, 20, 20),
            label: "Call",
            icon: Icon(Icons.call),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color.fromARGB(87, 204, 175, 44),
            backgroundColor: Colors.red,
            label: "Pan Tool",
            icon: Icon(Icons.pan_tool),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentState = index;
          });
        },
      ),
      body: pages[_currentState],
    );
  }
}
