import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/current_weather_model.dart';
import 'package:weatherapp/models/daily_weather_model.dart';
import 'package:weatherapp/models/forecast_weather_model.dart';
import 'package:weatherapp/services/current_weather_service.dart';
import 'package:weatherapp/services/daily_weather_service.dart';
import 'package:weatherapp/services/forecast_weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  bool isCurrentLoaded = false;
  bool isForecastLoaded = false;
  bool isDailyLoaded = false;

  CurrentWeatherModel? currentWeather;
  ForecastWeatherModel? forecastWeather;
  DailyWeatherModel? dailyWeather;

  String dayMonthYear = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
  String currentDayName = DateFormat('EEEE').format(DateTime.now());
  
  String hourMin = DateFormat('h:mm a').format(DateTime.now());
  String? lastUpdate;

  List<String> weekDays =["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];



  getCurrentWeather(String context) async {
    isCurrentLoaded = false;
    currentWeather = await CurrentWeatherService(context);

    isCurrentLoaded = true;
    notifyListeners();
    print(DateTime.now().weekday);

  }

  getForecastWeather(String context) async {
    isForecastLoaded = false;
    forecastWeather = await ForecastWeatherService(context);
    isForecastLoaded = true;


    notifyListeners();
  }

  getDailyWeather(String context) async{
    isDailyLoaded = false;
    dailyWeather = await DailyWeatherService(context);
    isDailyLoaded = true;

  }

  refreshDate() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      dayMonthYear = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
      hourMin = DateFormat('h:mm a').format(DateTime.now());
      notifyListeners();
    });
  }

  lastRefresh() {
    lastUpdate = DateFormat('h:mm a').format(DateTime.now());
  }
}
