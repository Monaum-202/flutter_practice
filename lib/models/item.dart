class Item {
  int? id;
  String name;
  int quantity;
  double price;
  bool isStock;
  DateTime expirationDate;
  String description;
  String category;

  // Constructor
  Item({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.isStock,
    required this.expirationDate,
    required this.description,
    required this.category,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
      isStock: map['isStock'],
      expirationDate: DateTime.parse(map['expirationDate']),
      description: map['description'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'isStock': isStock,
      'expirationDate': expirationDate.toIso8601String(),
      'description': description,
      'category': category,
    };
  }


  @override
  String toString() {
    return 'Item{id: $id, name: $name, quantity: $quantity, price: $price, isStock: $isStock, expirationDate: $expirationDate, description: $description, category: $category}';
  }
}
