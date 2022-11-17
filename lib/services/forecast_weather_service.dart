
import 'package:dio/dio.dart';
import 'package:weatherapp/models/forecast_weather_model.dart';
import 'package:weatherapp/models/geocoding_model.dart';

import 'package:weatherapp/services/api_key.dart';
import 'package:weatherapp/services/geocoding_service.dart';

Future<ForecastWeatherModel> ForecastWeatherService(String cityName) async {
  ForecastWeatherModel data;

  GeocodingModel x;

  x = await GeocdoingService(cityName);
 

  
  
  final response = await Dio().get(
    "https://api.openweathermap.org/data/2.5/forecast?lat=" +
        x.latitude.toString() +
        "&lon=" +
        x.longitude.toString() +
        "&appid=" +
        weather_api_key+
        "&units=metric"+"&lang=tr",
  );

  final responseJson = response.data;
  
  data = ForecastWeatherModel.fromJson(responseJson);
  
  
  
  return data;
}
