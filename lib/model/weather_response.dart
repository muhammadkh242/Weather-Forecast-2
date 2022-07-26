class WeatherResponse {
  num? lat;
  num? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;
  List<Alerts>? alerts;

  WeatherResponse(
      {this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        this.current,
        this.hourly,
        this.daily,
        this.alerts});

  WeatherResponse.fromJson(Map json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(new Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(new Daily.fromJson(v));
      });
    }
    if (json['alerts'] != null) {
      alerts = <Alerts>[];
      json['alerts'].forEach((v) {
        alerts!.add(new Alerts.fromJson(v));
      });
    }
  }

}

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  num? temp;
  int? pressure;
  int? humidity;
  int? clouds;
  int? visibility;
  num? windSpeed;
  int? windDeg;
  List<Weather>? weather;

  Current(
      {this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.pressure,
        this.humidity,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.weather});

  Current.fromJson(Map json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

}

class Hourly {
  int? dt;
  num? temp;
  int? pressure;
  int? humidity;
  int? clouds;
  int? visibility;
  num? windSpeed;
  List<Weather>? weather;

  Hourly(
      {this.dt,
        this.temp,
        this.pressure,
        this.humidity,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.weather,
        });

  Hourly.fromJson(Map json) {
    dt = json['dt'];
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
  }

}

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  Temp? temp;
  int? pressure;
  int? humidity;
  num? windSpeed;
  int? windDeg;
  List<Weather>? weather;
  int? clouds;

  Daily(
      {this.dt,
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.temp,
        this.pressure,
        this.humidity,
        this.windSpeed,
        this.windDeg,
        this.weather,
        this.clouds,
        });

  Daily.fromJson(Map json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
  }

}

class Temp {
  num? min;
  num? max;
  Temp({this.min, this.max});

  Temp.fromJson(Map json) {
    min = json['min'];
    max = json['max'];
  }

}


class Alerts {
  String? senderName;
  String? event;
  int? start;
  int? end;
  String? description;
  List<String>? tags;

  Alerts(
      {this.senderName,
        this.event,
        this.start,
        this.end,
        this.description,
        this.tags});

  Alerts.fromJson(Map json) {
    senderName = json['sender_name'];
    event = json['event'];
    start = json['start'];
    end = json['end'];
    description = json['description'];
    tags = json['tags'].cast<String>();
  }

}