import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/suggestion.dart';

//Create a provider to provide ApiService as a class
final apiServiceProvider = Provider<ApiService>(((ref) => ApiService()));

//Http request using Dio and returning model
class ApiService {
  Future<Suggestion> getSuggestion() async {
    try {
      var response = await Dio().get('http://www.boredapi.com/api/activity/');
      print(response);
      return Suggestion.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting suggestion');
    }
  }
}
