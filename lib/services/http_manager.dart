import 'package:dio/dio.dart';

const String server = "http://192.168.15.8:3001/";
//const String server = "http://10.92.198.4:3001/";

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

  userLogin(String email, String password) async {
    Response response;

    try {
      response = await dio.post('${server}login', data: {
        'email': email,
        'password': password,
      });

      return response.data;
    } catch (e) {
      if (e is DioException) {
        return e.response?.data;
      }
    }
  }

  userSignup({
    required String email,
    required String password,
    required String name,
    required String state,
    required String city,
    required String phone,
  }) async {
    Response response;

    try {
      response = await dio.post('${server}signup', data: {
        'email': email,
        'password': password,
        'name': name,
        'state': state,
        'city': city,
        'phone': phone,
      });

      return response.data;
    } catch (e) {
      if (e is DioException) {
        return e.response?.data;
      }
    }
  }
}
