import 'package:http/http.dart' as http;
import 'package:weatherapp/models/geocoding_model.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'dart:convert';

import 'package:weatherapp/services/api_key.dart';
import 'package:weatherapp/services/geocoding_service.dart';

Future<WeatherModel> WeatherService() async {
  WeatherModel data;

  GeocodingModel x;

  x = await GeocdoingService("Istanbul");
  print(x.name);
  print(x.latitude);
  print(x.longitude);

  
  
  final response = await http.get(
    Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=" +
        x.latitude.toString() +
        "&lon=" +
        x.longitude.toString() +
        "&appid=" +
        weather_api_key),
  );

  final responseJson = jsonDecode(response.body);
  
  data = WeatherModel.fromJson(responseJson);
  print(data.main!.temp.toString());
  
  
  return data;
}
