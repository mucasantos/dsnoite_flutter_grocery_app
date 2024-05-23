import 'package:flutter/material.dart';
import 'package:grocery_app/services/http_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Grocery"),
        leading: ElevatedButton(
            onPressed: () {
//Ir no servidor e pegar os dados do produto!
              HTTPManager().getProdutos();
            },
            child: const Text("OK")),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    'Camiseta Azul',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text('Tam GG / M / P'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "R\$29.98",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
