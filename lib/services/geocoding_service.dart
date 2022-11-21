
import 'dart:io';


import 'package:dio/dio.dart';

import '../models/geocoding_model.dart';
import 'api_key.dart';


Future<dynamic> GeocdoingService(String cityName) async {
  GeocodingModel x;
  
  try {
  final response = await Dio().get(
  'https://api.api-ninjas.com/v1/geocoding?city='+cityName,
  options: Options(headers: {
    "X-Api-Key": geocoding_api_key,
  } ),
  
  
  );
  
  final responseJson = (response.data)[0];
  
  x=GeocodingModel.fromJson(responseJson);
  return x;
}  catch (e) {
  return null;
}
  

  
}