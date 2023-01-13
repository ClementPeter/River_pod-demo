import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/suggestion.dart';

//Create a provider to provide ApiService as a class
final apiServiceProvider = Provider<ApiService>(((ref) => ApiService()));

//Http request using Dio and returning model
class ApiService {
  getSuggestion() async {
    try {
      var response = await Dio().get('http://www.boredapi.com/api/activity/');
      return suggestionFromJson(response.data);
      //print(response);
    } catch (e) {
      print(e);
      throw(e);
      
    }
  }
}
