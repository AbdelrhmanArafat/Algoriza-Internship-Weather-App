class CurrentWeatherModel {
  final WeatherLocation location;
  final WeatherCurrent current;
  final WeatherForecast forecast;

  CurrentWeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      location:
          WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
      current: WeatherCurrent.fromJson(json['current'] as Map<String, dynamic>),
      forecast: WeatherForecast.fromJson(json['forecast']),
    );
  }
}

class WeatherLocation {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localTimeEpoch;
  final String localTime;

  WeatherLocation({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localTimeEpoch,
    required this.localTime,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) {
    return WeatherLocation(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      tzId: json['tz_id'] as String,
      localTimeEpoch: json['localtime_epoch'] as int,
      localTime: json['localtime'] as String,
    );
  }
}

class WeatherCurrent {
  final double tempC;
  final double tempF;
  final String condition;
  final int humidity;

  WeatherCurrent({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.humidity,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherCurrent(
      tempC: json['temp_c'] as double,
      tempF: json['temp_f'] as double,
      condition: json['condition']['text'] as String,
      humidity: json['humidity'] as int,
    );
  }
}

class WeatherForecast {
  final List<WeatherForecastDay> forecastDay;

  WeatherForecast({
    required this.forecastDay,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      forecastDay: List<WeatherForecastDay>.from(
          json['forecastday'].map((e) => WeatherForecastDay.fromJson(e))),
    );
  }
}

class WeatherForecastDay {
  final WeatherDay day;
  final WeatherAstro astro;
  final List<WeatherHour> hour;

  WeatherForecastDay({
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory WeatherForecastDay.fromJson(Map<String, dynamic> json) {
    return WeatherForecastDay(
      day: WeatherDay.fromJson(json['day']),
      astro: WeatherAstro.fromJson(json['astro']),
      hour: List<WeatherHour>.from(
          json['hour'].map((e) => WeatherHour.fromJson(e))),
    );
  }
}

class WeatherAstro {
  final String sunrise;
  final String sunset;

  WeatherAstro({
    required this.sunrise,
    required this.sunset,
  });
  factory WeatherAstro.fromJson(Map<String, dynamic> json) {
    return WeatherAstro(
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
    );
  }
}

class WeatherHour {
  final double? windkph;
  final int? humidity;
  final double? uv;

  WeatherHour({
    required this.windkph,
    required this.humidity,
    required this.uv,
  });

  factory WeatherHour.fromJson(Map<String, dynamic> json) {
    return WeatherHour(
      windkph: json['wind_kph'] as double,
      humidity: json['humidity'] as int,
      uv: json['uv'] as double,
    );
  }
}

class WeatherDay {
  final double maxTempC;
  final double minTempC;
  final double avgTempC;
  final double avgHumidity;
  final int dailyChanceOfRain;

  WeatherDay({
    required this.maxTempC,
    required this.minTempC,
    required this.avgTempC,
    required this.avgHumidity,
    required this.dailyChanceOfRain,
  });

  factory WeatherDay.fromJson(Map<String, dynamic> json) {
    return WeatherDay(
      maxTempC: json['maxtemp_c'] as double,
      minTempC: json['mintemp_c'] as double,
      avgTempC: json['avgtemp_c'] as double,
      avgHumidity: json['avghumidity'] as double,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int,
    );
  }
}
