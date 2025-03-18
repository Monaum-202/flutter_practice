import 'package:flutter/material.dart';
import 'package:test_app/fomEx.dart';
import '../db/database_helper.dart';
import '../models/item.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD SQLite',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ItemListPage(),
    );
  }
}

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  late Future<List<Item>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = DatabaseHelper2().getAllItems();
    print(_itemsFuture.toString()); // Fetch items from DB
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item List')),
      body: FutureBuilder<List<Item>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items found'));
          }

          final items = snapshot.data!;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(
                  'Category: ${item.category}, Price: \$${item.price}',
                ),
                onTap: () {
                  // Navigate to form for editing
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              FormPage(title: "Add Student", item: item),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await DatabaseHelper2().deleteItem(item.id);
                    setState(() {
                      _itemsFuture = DatabaseHelper2().getAllItems();
                    });
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(title: "Add Student"),
            ),
          );
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Add')));
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add), // You can use different icons or custom widgets
      ),
    );
  }
}