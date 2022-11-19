import 'package:dio/dio.dart';

import 'package:weatherapp/models/geocoding_model.dart';

import 'package:weatherapp/services/api_key.dart';
import 'package:weatherapp/services/geocoding_service.dart';

import '../models/daily_weather_model.dart';

Future<dynamic> DailyWeatherService(String cityName) async {
  DailyWeatherModel data;

  GeocodingModel x;

  x = await GeocdoingService(cityName);

  try {
    final response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/forecast/daily?/",
        queryParameters: {
          "lat": x.latitude.toString(),
          "lon": x.longitude,
          "appid": weather_api_key,
          "units": "metric",
          "lang": "tr"
        });

    data = DailyWeatherModel.fromJson(response.data);
    return data;
  } catch (e) {
    if (e is DioError) {
      return e;
    }
  }
}
