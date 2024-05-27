import 'package:dio/dio.dart';

//const String server = "http://192.168.15.5:3001/";
const String server = "http://10.92.198.38:3001/";

class HTTPManager {
  final dio = Dio();

  getProducts() async {
    Response response;
    response = await dio.get('${server}products');
    return response.data;
  }

  getCategories() async {
    Response response;
    response = await dio.get('${server}categories');
    return response.data;
  }
}
