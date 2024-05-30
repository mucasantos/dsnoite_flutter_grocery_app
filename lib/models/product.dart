import 'dart:convert';

class Products {
  List<Product>? products;
  Products({this.products});
  //Criar um decoder from Json para converter os dados que vêm da API em uma classe
  Products.fromJson(Map<String, dynamic> json) {
    if (json["products"] != null) {
      products = [];
      json["products"].forEach((produto) => {
            //Guardar na lista de produtos!
            products?.add(Product.fromJson(produto))
          });
    }
  }
}

class Product {
  int id;
  int quantity;
  String name;
  String image;
  String description;
  double price;
  int review;
  int categoryId;
  int userId;

  Product({
    required this.id,
    required this.quantity,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.review,
    required this.categoryId,
    required this.userId,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        quantity: json["quantity"] ?? 0,
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        review: json["review"] ?? 0,
        categoryId: json["categoryId"] ?? 0,
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "review": review,
        "categoryId": categoryId,
        "userId": userId,
      };
}
