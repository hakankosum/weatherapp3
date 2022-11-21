// ignore_for_file: prefer_typing_uninitialized_variables

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

  // ignore: prefer_typing_uninitialized_variables
  var currentWeather;
  var forecastWeather;
  var dailyWeather;

  String dayMonthYear = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
  String currentDayName = DateFormat('EEEE').format(DateTime.now());

  String hourMin = DateFormat('h:mm a').format(DateTime.now());
  String? lastUpdate;

  List<String> weekDays = [
    "Pazartesi",
    "Salı",
    "Çarşamba",
    "Perşembe",
    "Cuma",
    "Cumartesi",
    "Pazar"
  ];

  getCurrentWeather(String context) async {
    isCurrentLoaded = false;
    currentWeather = await CurrentWeatherService(context);
    if (currentWeather.runtimeType == CurrentWeatherModel) {
      isCurrentLoaded = true;
    }
    else{
      print("current service has " +currentWeather.runtimeType.toString());
    }

    notifyListeners();
  }

  getForecastWeather(String context) async {
    isForecastLoaded = false;
    forecastWeather = await ForecastWeatherService(context);
    if (forecastWeather.runtimeType == ForecastWeatherModel) {
      isForecastLoaded = true;
    }
    else{
      print("forecast service has "+forecastWeather.runtimeType.toString());
    }

    notifyListeners();
  }

  getDailyWeather(String context) async {
    isDailyLoaded = false;
    dailyWeather = await DailyWeatherService(context);
    if (dailyWeather.runtimeType == DailyWeatherModel) {
      isDailyLoaded = true;
    }
    else{
      
      
    }
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
