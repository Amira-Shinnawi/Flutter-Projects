import 'package:dio/dio.dart';

class APIService {
  final _baseURL = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  APIService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseURL$endPoint');
    return response.data;
  }
}
