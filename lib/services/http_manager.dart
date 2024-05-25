import 'package:dio/dio.dart';

class HTTPManager {
  final dio = Dio();

  getProducts() async {
    Response response;
    response = await dio.get('http://10.92.198.38:3001/products');
    return response.data;
  }

  getCategories() async {
    Response response;
    response = await dio.get('http://10.92.198.38:3001/categories');
    return response.data;
  }
}
