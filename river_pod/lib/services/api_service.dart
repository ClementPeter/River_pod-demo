// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:river_pod/models/suggestion.dart';

// //Create a provider to provide ApiService as a class - Used to Demo FutureProvider in future_provider_page.dart
// final apiServiceProvider = Provider<ApiService>(((ref) => ApiService()));

// //Http request using Dio and returning model
// class ApiService {
//   Future<Suggestion> getSuggestion() async {
//     try {
//       var response = await Dio().get('http://www.boredapi.com/api/activity/');
//       print(response);
//       return Suggestion.fromJson(response.data);
//     } catch (e) {
//       throw Exception('Error getting suggestion');
//     }
//   }
// }

// Uncomment Demo usage of .family modifier to pass and append value to API
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/suggestion.dart';

//Create a provider to provide ApiService as a class - Used to Demo FutureProvider in future_provider_page.dart
final apiServiceProvider = Provider<ApiService>(((ref) => ApiService()));

//Http request using Dio and returning model
class ApiService {
  Future<Suggestion> getSuggestion(String id) async {
    print(id);
    try {
      var response = await Dio().get('http://www.boredapi.com/api/activity/');
      print(response);
      return Suggestion.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting suggestion');
    }
  }
}
