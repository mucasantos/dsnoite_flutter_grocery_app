import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';
import 'package:grocery_app/views/widgets/cart_product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var items = List<String>.generate(10, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        //  prototypeItem: ListTile(
        //    title: Text(items.first),
        //  ),
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            background: Container(
              color: Colors.white,
            ),
            secondaryBackground: Container(
              color: const Color.fromARGB(255, 212, 99, 91),
            ),
            child: const CartProductCard(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
          label: const Text("Finalizar Pedido"), onPressed: () {}),
    );
  }
}
