import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_updated/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = 'http://api.weatherapi.com/v1';
  final String APIKey = 'baf88fde2f1a4325836200603232907';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$APIKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.requestOptions.data['error']['message'] ??
          'oops, there is an error , please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops, there is an error , please try again later');
    }
  }
}
