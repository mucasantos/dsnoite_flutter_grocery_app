import 'package:flutter/material.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/services/app_constants.dart';
import 'package:grocery_app/services/http_manager.dart';
import 'package:grocery_app/views/detail_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//Criar uma var (lista) do tipo Products
Products? allProds;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: Chamar a API e adicionar os dados na lista de produtos!
    getProducts();
    super.initState();
  }

  getProducts() async {
    //Ir no servidor e pegar os dados do produto!
    var allProducts = await HTTPManager().getProducts();
    //Alimentar a lista allProds com a lista que vem do Server
    setState(() {
      allProds = Products.fromJson(allProducts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("App Grocery"),
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

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      product: allProds!.products![index],
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 206, 203, 203),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Image.network(
                        allProds!.products![index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        allProds!.products![index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(allProds!.products![index].review.toString()),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "R\$${allProds!.products![index].price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            //  margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
