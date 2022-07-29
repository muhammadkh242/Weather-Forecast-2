import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather/network/dio_client.dart';
import 'package:weather/repository/repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/shared/constants.dart';
import '../../../model/weather_response.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class HomeProvider extends ChangeNotifier {
  final WeatherRepo _weatherRepo = WeatherRepo(DioClient());
  WeatherResponse weatherResponse = WeatherResponse();

  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  String currentAddress = "";
  int unitIndex = Settings.getValue(keyUnits, 1);
  String unitSymbol = "°C";
  late StreamSubscription<Position> positionStream;

  HomeProvider() {
    checkGps();
  }

  void getCurrentWeather() {
    print(getUnit());
    _weatherRepo.getCurrentWeather(lat: lat, long: long,unitSystem: getUnit()).then((value) {
      weatherResponse = value;
      notifyListeners();
    });
  }

  String getUnit(){
    String unit = "";
    switch (unitIndex) {
      case 3:

        unit = "standard";
        unitSymbol = "°K";
        break;
      case 2:
        unit = "imperial";
        unitSymbol = "°F";

        break;
      default:
        unit = "metric";
        unitSymbol = "°C";

        break;
    }
    return unit;
  }

  checkGps() async {
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (serviceStatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          hasPermission = true;
        }
      } else {
        hasPermission = true;
        print("Location permissions true");
      }
      if (hasPermission) {
        await getLocation();
        getCurrentWeather();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    long = position.longitude.toString();
    lat = position.latitude.toString();
    getAddressFromLatLong(position);
/*    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

    });*/
  }

  getAddressFromLatLong(Position position)async {
    List placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMarks[0];
    currentAddress = "${place.locality} ,${place.administrativeArea}, ${place.country}";
  }
}
