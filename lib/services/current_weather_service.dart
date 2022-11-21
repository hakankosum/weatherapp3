import 'package:http/http.dart' as http;
import 'package:weatherapp/models/geocoding_model.dart';
import 'package:weatherapp/models/current_weather_model.dart';

import 'package:dio/dio.dart';

import 'package:weatherapp/services/api_key.dart';
import 'package:weatherapp/services/geocoding_service.dart';

Future<dynamic> CurrentWeatherService(String cityName) async {
  var data;

  var x;

  x = await GeocdoingService(cityName);

  try {
    final response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather/",
        queryParameters: {
          "lat": x.latitude.toString(),
          "lon": x.longitude,
          "appid": weather_api_key,
          "units": "metric",
          "lang": "tr"
        });

    data = CurrentWeatherModel.fromJson(response.data);
    return data;
  } catch (e) {
    if (e is DioError){
      
      return e;
    }
  }
}
