import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';
import 'package:grocery_app/views/widgets/app_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var items = List<String>.generate(10000, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OK"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        //  prototypeItem: ListTile(
        //    title: Text(items.first),
        //  ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(2),
            color: Colors.blueGrey,
            width: double.infinity,
            height: 100,
            child: Row(children: [
              Image.asset(
                "assets/images/start.jpg",
              ),
              Column(
                children: [
                  const Text("data"),
                  const Text("data"),
                  Row(
                    children: [
                      SizedBox(
                          width: 40,
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mainColor,
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ))),
                              child: const Icon(Icons.remove),
                              onPressed: () {})),
                      const Text("1"),
                      SizedBox(
                          width: 40,
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mainColor,
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ))),
                              child: const Icon(Icons.add),
                              onPressed: () {}))
                    ],
                  )
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
