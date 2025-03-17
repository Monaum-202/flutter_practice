import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: Practice8(),
    );
  }
}

class Practice8 extends StatefulWidget {
  const Practice8({super.key});

  @override
  State<Practice8> createState() => _Practice8State();
}

class _Practice8State extends State<Practice8> {
  int _counter = 0;
  String? selectedItem;
  bool isSwitchOn = false;
  int? selectedRadio;
  double _sliderValue = 0.0;
  bool isChecked = false;
  String? name;

  // For TextFormField validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Examples")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 1. TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  print("User entered: $value");
                },
              ),
              SizedBox(height: 16),

              // 2. TextFormField
              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),

              // 3. Date Picker
              ElevatedButton(
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  print("Selected date: $selectedDate");
                },
                child: Text('Pick a Date'),
              ),
              SizedBox(height: 16),

              // 4. Time Picker
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  print("Selected time: ${selectedTime?.format(context)}");
                },
                child: Text('Pick a Time'),
              ),
              SizedBox(height: 16),

              // 5. DropdownButton
              DropdownButton<String>(
                value: selectedItem,
                hint: Text("Select an item"),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue;
                  });
                },
                items:
                    <String>[
                      'Item 1',
                      'Item 2',
                      'Item 3',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
              SizedBox(height: 16),

              // 6. Switch (Toggle Button)
              Switch(
                value: isSwitchOn,
                onChanged: (bool newValue) {
                  setState(() {
                    isSwitchOn = newValue;
                  });
                },
              ),
              SizedBox(height: 16),

              // 7. Checkbox
              Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue!;
                  });
                },
              ),
              SizedBox(height: 16),

              // 8. Radio Button
              Column(
                children: <Widget>[
                  Radio<int>(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRadio = value;
                      });
                    },
                  ),
                  Radio<int>(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRadio = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),

              // 9. Slider
              Slider(
                value: _sliderValue,
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (double newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
              ),
              SizedBox(height: 16),

              // 10. TextField with Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 11. Number Input
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 12. Multi-Line Text Input
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Enter your message',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 13. Custom Input with TextInputFormatter (Allow Only Numbers)
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp('[0-9]'),
                  ), // Only numbers
                ],
                decoration: InputDecoration(
                  labelText: 'Enter digits',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
