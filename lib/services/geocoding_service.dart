import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../models/geocoding_model.dart';
import 'api_key.dart';


Future<GeocodingModel> GeocdoingService(String cityName) async {
  final response = await http.get(
  Uri.parse('https://api.api-ninjas.com/v1/geocoding?city='+cityName),

  headers: {
    "X-Api-Key": geocoding_api_key,
  },
);
  print(response.body);
  final responseJson = jsonDecode(response.body);

  return GeocodingModel.fromJson(responseJson[0]);
}