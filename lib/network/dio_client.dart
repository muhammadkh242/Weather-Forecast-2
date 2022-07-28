import 'package:dio/dio.dart';
import 'package:weather/model/weather_response.dart';
import 'package:weather/shared/constants.dart';
import 'dart:convert';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
    ));
  }

  Future<dynamic> getCurrentWeather({required String lat, required String long}) async{
    Map<String, dynamic> queries =  {
      'units': 'metric',
      'lat': lat,
      'lon': long,
      'appid': 'c67c9ddb5f0fa54ea9629f71fd2412d2'
    };
    Response response = await dio.get(endPoint, queryParameters: queries);
    return response.data;
  }

}
