import 'package:dio/dio.dart';

class HTTPManager {
  final dio = Dio();

  getProdutos() async {
    Response response;
    response = await dio.get('http://10.92.198.38:3001/products');
    return response.data;
  }
}
