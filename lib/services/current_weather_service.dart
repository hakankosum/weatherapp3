import 'package:http/http.dart' as http;
import 'package:weatherapp/models/geocoding_model.dart';
import 'package:weatherapp/models/current_weather_model.dart';
import 'dart:convert';

import 'package:weatherapp/services/api_key.dart';
import 'package:weatherapp/services/geocoding_service.dart';

Future<CurrentWeatherModel> CurrentWeatherService(String cityName) async {
  CurrentWeatherModel data;

  GeocodingModel x;

  x = await GeocdoingService(cityName);
 

  
  
  final response = await http.get(
    Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=" +
        x.latitude.toString() +
        "&lon=" +
        x.longitude.toString() +
        "&appid=" +
        weather_api_key+
        "&units=metric"+"&lang=tr"),
  );

  final responseJson = jsonDecode(response.body);
  
  data = CurrentWeatherModel.fromJson(responseJson);
  
  
  
  return data;
}
