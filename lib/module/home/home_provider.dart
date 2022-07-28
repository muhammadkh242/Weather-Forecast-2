import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather/network/dio_client.dart';
import 'package:weather/repository/repository.dart';
import 'package:geolocator/geolocator.dart';
import '../../model/weather_response.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';

class HomeProvider extends ChangeNotifier {
  final WeatherRepo _weatherRepo = WeatherRepo(DioClient());
  WeatherResponse weatherResponse = WeatherResponse();

  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  String currentAddress = "";
  late StreamSubscription<Position> positionStream;

  HomeProvider() {
    checkGps();
  }

  void getCurrentWeather() {
    _weatherRepo.getCurrentWeather(lat: lat, long: long).then((value) {
      weatherResponse = value;
      notifyListeners();
    });
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
    print("long : ${position.longitude}");
    print("lat : ${position.latitude}");

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
    currentAddress = '${place.administrativeArea}';
  }
}
