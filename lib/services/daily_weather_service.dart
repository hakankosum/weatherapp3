
import 'package:dio/dio.dart';


import 'package:weatherapp/models/geocoding_model.dart';



import 'package:weatherapp/services/api_key.dart';
import 'package:weatherapp/services/geocoding_service.dart';

import '../models/daily_weather_model.dart';

Future<DailyWeatherModel> DailyWeatherService(String cityName) async {
  DailyWeatherModel data;

  GeocodingModel x;

  x = await GeocdoingService(cityName);
 

  
  
  final response = await Dio().get(
    "https://api.openweathermap.org/data/2.5/forecast/daily?lat=" +
        x.latitude.toString() +
        "&lon=" +
        x.longitude.toString() +
        "&appid=" +
        weather_api_key+
        "&units=metric"+"&lang=tr",
  );

  final responseJson = response.data;
  
  data = DailyWeatherModel.fromJson(responseJson);
  
  
  
  return data;
}
