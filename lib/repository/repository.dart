import 'package:weather/model/weather_response.dart';
import 'package:weather/network/dio_client.dart';

class WeatherRepo {

  final DioClient dioClient;

  WeatherRepo(this.dioClient);

  Future<WeatherResponse> getCurrentWeather({required String lat, required String long}) async {
    var res =  await dioClient.getCurrentWeather(lat: lat, long: long);
    return WeatherResponse.fromJson(res);
  }

//      return  Movie.fromJson(json.decode(response.body)).results;
}