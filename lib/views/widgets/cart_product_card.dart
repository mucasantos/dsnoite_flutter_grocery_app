import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(2),
      color: const Color.fromARGB(35, 83, 177, 117),
      width: double.infinity,
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          "assets/images/start.jpg",
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("data"),
            const Text("data"),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  //  margin: const EdgeInsets.all(16),
                  decoration: boxDecorationButton,
                  child: IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  //  margin: const EdgeInsets.all(16),
                  decoration: boxDecorationButton,
                  child: IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.close),
            Text(
              "R\$4.99",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
