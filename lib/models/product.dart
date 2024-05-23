import 'dart:convert';

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
        quantity: json["quantity"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        review: json["review"],
        categoryId: json["categoryId"],
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
