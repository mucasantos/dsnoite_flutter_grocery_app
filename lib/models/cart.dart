import 'dart:convert';

class Cart {
  String message;
  List<CartProduct> cartProducts;

  Cart({
    required this.message,
    required this.cartProducts,
  });

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        message: json["message"],
        cartProducts: List<CartProduct>.from(
            json["cartProducts"].map((x) => CartProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "cartProducts": List<dynamic>.from(cartProducts.map((x) => x.toJson())),
      };
}

class CartProduct {
  int id;
  int quantity;
  String name;
  String image;
  String description;
  double price;
  int review;
  int categoryId;
  int userId;
  CartItem cartItem;

  CartProduct({
    required this.id,
    required this.quantity,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.review,
    required this.categoryId,
    required this.userId,
    required this.cartItem,
  });

  factory CartProduct.fromRawJson(String str) =>
      CartProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["id"],
        quantity: json["quantity"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        review: json["review"],
        categoryId: json["categoryId"],
        userId: json["userId"],
        cartItem: CartItem.fromJson(json["cartItem"]),
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
        "cartItem": cartItem.toJson(),
      };
}

class CartItem {
  int id;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  int cartId;
  int productId;

  CartItem({
    required this.id,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.cartId,
    required this.productId,
  });

  factory CartItem.fromRawJson(String str) =>
      CartItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cartId: json["cartId"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "cartId": cartId,
        "productId": productId,
      };
}
