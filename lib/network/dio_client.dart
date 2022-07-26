import 'package:dio/dio.dart';
import 'package:weather/shared/constants.dart';

class DioClient {
  late Dio dio;
  Map<String, dynamic> queries =  {
    'units': 'en',
    'lat': '61.5240',
    'lon': '105.3188',
    'appid': 'c67c9ddb5f0fa54ea9629f71fd2412d2'
  };
  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
    ));
  }

  Future<dynamic> getCurrentWeather() async{
    Response response = await dio.get(endPoint,queryParameters: queries) ;
    print(response.data);
    return response.data;
  }

}
