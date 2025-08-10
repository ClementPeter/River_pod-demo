// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:river_pod/models/suggestion.dart';

// //Create a provider to provide ApiService as a class - Used to Demo FutureProvider in future_provider_page.dart
// final apiServiceProvider = Provider<ApiService>(((ref) => ApiService()));

// //Http request using Dio and returning model
// class ApiService {
//   Future<Suggestion> getSuggestion() async {
//     try {
        //http://www.boredapi.com/api/activity/ 
//       var response = await Dio().get('https://bored-api.appbrewery.com/random');
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
      //http://www.boredapi.com/api/activity/
      //https://bored-api.appbrewery.com/activity/3943506
      var response = await Dio().get('https://bored-api.appbrewery.com/activity/3943506/$id');
      print(response);
      return Suggestion.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting suggestion');
    }
  }
}
