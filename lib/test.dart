import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    // prefs = await SharedPreferences.getInstance();
  }

  final String login = 'https://jsonplaceholder.typicode.com';

  void _login() async {
    if (emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      var reqBody = {
        "userName": emailTextEditingController.text,
        "pass": passwordTextEditingController.text,
      };

      // var response = await http.post(Uri.parse(login),
      //     headers: {"Content-Type": "application/json"},
      //     body: jsonEncode(reqBody));

      // var jsonResponse = jsonDecode(response.body);
      // if (jsonResponse['status']) {
      //   var myToken = jsonResponse['token'];
      //   // Navigator.push(context,
      //   //     MaterialPageRoute(builder: (context) => Dashboard(token: myToken)));
      //   //
      //   // Navigator.pushNamedAndRemoveUntil(
      //   //     context, RegistrationScreen.idScreen, (route) => false);
      // } else {
      //   print('Something went wrong');
      // }
    }
  }

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 35.0),
              Image(
                image: AssetImage("images/logo.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.0),
              Text(
                "Login as a Rider",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 1.0),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(fontSize: 14.0),
                        // hintText: "Email",
                        hintStyle: TextStyle(fontSize: 30, color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 1.0),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 14.0),
                        // hintText: "Email",
                        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 20.0),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            // side: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),
                      child: SizedBox(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "bolt-semibold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (!emailTextEditingController.text.contains("@")) {
                          displayToastMessage("Invalid email. ", context);
                        } else if (passwordTextEditingController.text.length <
                            6) {
                          displayToastMessage("Invalid password. ", context);
                        } else {
                          displayToastMessage(
                            "Hello !!${emailTextEditingController.text}  ${passwordTextEditingController.text}",
                            context,
                          );

                          // loginAndAuthenticateUser(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, RegistrationScreen.idScreen, (route) => false);
                  // print("Registered Button Clicked");
                },
                child: Text("Do not have a Account? Register Here"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginAndAuthenticateUser(BuildContext context) async {
    // print("-----------------------");
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
