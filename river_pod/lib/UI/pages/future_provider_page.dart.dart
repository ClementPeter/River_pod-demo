import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/suggestion.dart';
import 'package:river_pod/services/api_service.dart';

//Create Future Provider to read the ApiService Provider
final suggestionFutureProvider = FutureProvider<Suggestion>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});

//final suggestionFutureProvider =
class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({this.color, super.key});
  final Color? color;
  @override
  Widget build(BuildContext context, ref) {
    //watching the exposed by a provider and rebuild the widget when that value changes.
    final suggestionReference = ref.watch(suggestionFutureProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Future Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: suggestionReference.when(data: ((data) {
              Text(data.activity!);
            }), error: ((error, stackTrace) {
              Text(error.toString());
            }), loading: () {
              return const CircularProgressIndicator();
            }),
          )
        ],
      ),
    );
  }
}
