import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/services/http_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Criar uma var (lista) do tipo Products
Products? allProds;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("App Grocery"),
            ElevatedButton(
                onPressed: () async {
                  //Ir no servidor e pegar os dados do produto!
                  var allProducts = await HTTPManager().getProdutos();
                  //Alimentar a lista allProds com a lista que vem do Server
                  setState(() {
                    allProds = Products.fromJson(allProducts);
                  });
                },
                child: const Text("Get Data")),
          ],
        ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
          ),
          itemCount: allProds?.products?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            if (allProds == null) {
              Container();
            }

            return Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      allProds!.products![index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    allProds!.products![index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(allProds!.products![index].review.toString()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "R\$${allProds!.products![index].price}",
                          style: const TextStyle(
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
