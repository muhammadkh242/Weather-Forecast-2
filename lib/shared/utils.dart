import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String convertTime(int timeInMilliseconds) {
  DateTime time =
      DateTime.fromMillisecondsSinceEpoch(timeInMilliseconds * 1000);
  return DateFormat("HH:mm").format(time);
}

String convertDay(int timeInMilliseconds) {
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(timeInMilliseconds * 1000);
  return DateFormat("EEE").format(date);
}

String getWeatherStateIcon(
    {required String state,
    required bool fromHour,
    required int timeInMilliseconds}) {

  late String iconName;
  if (state.isNotEmpty &&
      TimeOfDay.fromDateTime(DateTime.fromMillisecondsSinceEpoch(
                  timeInMilliseconds * 1000))
              .period
              .name ==
          "am" &&
      fromHour) {
    return "assets/images/half-moon.png";
  }
  if (state.isNotEmpty) {
    switch (state) {
      case "Clouds":
        iconName = "cloudy";
        break;
      case "Clear":
        iconName = "sun";
        break;
      case "Thunderstorm":
        iconName = "thunderstorm";
        break;
      case "Drizzle":
        iconName = "drizzle";
        break;
      case "Rain":
        iconName = "rain";
        break;
      case "Snow":
        iconName = "snow";
        break;
      case "Mist":
        iconName = "mist";
        break;
      case "Smoke":
        iconName = "smoke";
        break;
      case "Haze":
        iconName = "haze";
        break;
      case "Dust":
        iconName = "dust";
        break;
      case "Fog":
        iconName = "fog";
        break;
      case "Sand":
        iconName = "dust";
        break;
      case "Ash":
        iconName = "haze";
        break;
      case "Squall":
        iconName = "squall";
        break;
      case "Tornado":
        iconName = "thunderstorm";
        break;
      default:
        iconName = "sun";
        break;
    }
  }

  return "assets/images/$iconName.png";
}
