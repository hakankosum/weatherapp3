import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/current_weather_model.dart';
import 'package:weatherapp/services/current_weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  CurrentWeatherModel? currentWeather;
  String dayMonthYear = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
  String hourMin = DateFormat('h:mm a').format(DateTime.now());
  String? lastUpdate;

  getCurrentWeather(String context) async {
    isLoading = false;
    currentWeather = await CurrentWeatherService(context);

    isLoading = true;
    notifyListeners();
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
