//Product Model
class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  final String id;
  final String title;
  final String description;
  final double price;
}

//Product List holding Product
final List<Product> productList = [
  Product(
    id: "1",
    title: "PS 5",
    description: "Brand new PS5 Console",
    price: 350.0,
  ),
  Product(
    id: "2",
    title: "M1 Pro",
    description: "Apple product",
    price: 650.0,
  ),
  Product(
    id: "3",
    title: "Crocs",
    description: "Custom built crocs",
    price: 75.50,
  ),
  Product(
    id: "4",
    title: "Hoodie",
    description: "AOT Merch Hoodie",
    price: 19.99,
  )
];
