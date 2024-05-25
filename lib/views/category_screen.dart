import 'package:flutter/material.dart';
import 'package:grocery_app/models/categories.dart';
import 'package:grocery_app/services/http_manager.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

//Criar uma var (lista) do tipo Products
Categories? allCats;

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getCategories();
    super.initState();
  }

  getCategories() async {
    //Ir no servidor e pegar os dados do produto!
    var categories = await HTTPManager().getCategories();
    //Alimentar a lista allProds com a lista que vem do Server
    setState(() {
      allCats = Categories.fromJson(categories);
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
            childAspectRatio: 4 / 4,
          ),
          itemCount: allCats?.categories.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            if (allCats == null) {
              Container();
            }
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    allCats!.categories[index].image,
                    fit: BoxFit.fill,
                    // width: 80,
                  ),
                  Text(
                    allCats!.categories[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
