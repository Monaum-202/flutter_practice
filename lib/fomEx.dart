import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/db/database_helper.dart';
import 'package:test_app/helpers/database_helper.dart';
import 'package:test_app/models/item.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: FormPage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class FormPage extends StatelessWidget {
  final String title;
  final Item? item;

  const FormPage({required this.title, Key? key, this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ItemForm(item: item,),
      ),
    );
  }
}

class ItemForm extends StatefulWidget {
  final Item? item;
  ItemForm({this.item});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _inStock = false;

  DateTime _expirationDate = DateTime.now();
  String? _selectedCategory;

  final List<String> _categories = ['Electronics', 'Clothing', 'Groceries'];

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      _nameController.text = widget.item!.name;
      _quantityController.text = widget.item!.quantity.toString();
      _priceController.text = widget.item!.price.toString();
      _inStock = widget.item!.isStock;
      _expirationDate = widget.item!.expirationDate;
      _selectedCategory = widget.item!.category;
      _descriptionController.text = widget.item!.description;
    }
  }


Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _expirationDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _expirationDate) {
      setState(() {
        _expirationDate = picked;
      });
    }
  }
  
  String getFormattedDate(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date); // Formatting the date
  }

  String getFormattedPrice(double price) {
    return NumberFormat.simpleCurrency().format(price); // Formatting the price
  }

  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Item Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityController,
            decoration: InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a quantity';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceController,
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price';
              }
              return null;
            },
          ),
          
          
          // CheckboxListTile(
          //   title: Text('In Stock'),
          //   value: _inStock,
          //   onChanged: (value) {
          //     setState(() {
          //       _inStock = value ?? false;
          //     });
          //   },
          // ),

          Row(
            children: <Widget>[
              Text('In Stock'),
              Checkbox(
                value: _inStock,
                onChanged: (value) {
                  setState(() {
                    _inStock = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Expiration Date: ${getFormattedDate(_expirationDate)}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),


        //Date Picker
          // ListTile(
          //   title: Text('Expiration Date: ${getFormattedDate(_expirationDate)}'),
          //   trailing: IconButton(
          //     icon: Icon(Icons.calendar_today),
          //     onPressed: () {
          //       _selectDate(context);
          //     },
          //   ),
          // ),


SizedBox(height: 20,),         
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            decoration: InputDecoration(labelText: 'Category'),
            items: _categories.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value as String?;
              });
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
SizedBox(height: 20,),
          // Submit Button
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final item = Item(
                    name: _nameController.text,
                    quantity: int.parse(_quantityController.text),
                    price: double.parse(_priceController.text),
                    isStock: _inStock,
                    expirationDate: _expirationDate,
                    description: _descriptionController.text,
                    category: _selectedCategory!,
                  );

                  // print('Item: $item');



                  if (widget.item == null) {
                    // Add item
                    int abc = await DatabaseHelper2().insertItem(item);
                    print( abc );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage(title: 'Add Item')));
                  } else {
                    // Update item
                    await DatabaseHelper2().updateItem(item);
                    print('Updating item: $item');
                  }
                }
              },
              
              child: Text(widget.item == null ? 'Add Item' : 'Update Item')
            ),
          ),
         ],
      ),
    );
  }
}



