import 'package:dio/dio.dart';

const String serverCasa = "http://192.168.15.5:3001/";
const String serverSenai = "http://10.92.198.38:3001/";

class HTTPManager {
  final dio = Dio();

  getProducts() async {
    Response response;
    response = await dio.get('${serverCasa}products');
    return response.data;
  }

  getCategories() async {
    Response response;
    response = await dio.get('${serverCasa}categories');
    return response.data;
  }
}
