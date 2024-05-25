import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OK"),
      ),
      body: Column(
        children: [
          Image.network(
            product.image,
            height: 200,
            fit: BoxFit.fill,
          ),
          Row(
            children: [
              Text(
                product.name,
              ),
              const Icon(
                Icons.favorite_border_outlined,
              )
            ],
          ),
          Row(
            children: [
              Text(product.price.toString()),
            ],
          ),
          Text(product.description),
          Row(
            children: [
              const Text("Review"),
              for (int n = 1; n <= product.review; n++)
                const Icon(
                  Icons.star,
                  color: Color(0xffF3603F),
                )
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Comprar"))
          //Row -> button e text
          //Texto
          //Texto
          //Row com texto e review
          //Button
        ],
      ),
    );
  }
}
