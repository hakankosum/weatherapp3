
import 'package:dio/dio.dart';
import 'package:weatherapp/models/forecast_weather_model.dart';
import 'package:weatherapp/models/geocoding_model.dart';

import 'package:weatherapp/services/api_key.dart';
import 'package:weatherapp/services/geocoding_service.dart';

Future<dynamic> ForecastWeatherService(String cityName) async {
  ForecastWeatherModel data;

  GeocodingModel x;

  x = await GeocdoingService(cityName);
 

  
  
  try {
    final response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/forecast/",
        queryParameters: {
          "lat": x.latitude.toString(),
          "lon": x.longitude,
          "appid": weather_api_key,
          "units": "metric",
          "lang": "tr"
        });

    data = ForecastWeatherModel.fromJson(response.data);
    return data;
  } catch (e) {
    if (e is DioError){
      
      return e;
    }
  }
}
