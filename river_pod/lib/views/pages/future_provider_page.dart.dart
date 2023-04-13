import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/suggestion.dart';
import 'package:river_pod/services/api_service.dart';

//Create FutureProvider to read the ApiService Provider - autoDispose triggers the ApiServiceProvder to bring new Data
final suggestionFutureProvider = FutureProvider<Suggestion>((ref) {
  final apiService = ref.watch(apiServiceProvider); //watch the provider
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RefreshIndicator(
          onRefresh: () {
            //.refresh forces a provider to check its state to see if the value is set to the default value
            //. refresh in this case triggers the Provider to make a new network request indirectly
            return ref.refresh(suggestionFutureProvider.future);
          },
          child: ListView(
            children: [
              Center(
                //handle the FutureProvider changes with .when
                child: suggestionReference.when(data: ((data) { 
                  return Text(
                    data.activity!,
                    style: Theme.of(context).textTheme.headline5,
                  );
                }), error: ((error, _) {
                  return Text(
                    error.toString(),
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  );
                }), loading: () {
                  return const CircularProgressIndicator();
                }),
              ),
              const SizedBox(height: 50),
              Text(
                "Pull to refresh in order to see random activity you can do when your bored",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ////////////////////////////////////
// //Demo of .family modifier

// ///////////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:river_pod/models/suggestion.dart';
// import 'package:river_pod/services/api_service.dart';

// //Create FutureProvider to read the ApiService Provider -
// // autoDispose triggers the ApiServiceProvder to bring new Data
// //.family to parse an extra variable via our provider
// final suggestionFutureProvider =
//     FutureProvider.family<Suggestion, String>((ref, id) {
//   final apiService = ref.watch(apiServiceProvider); //watch the provider
//   return apiService.getSuggestion(id);
// });

// //final suggestionFutureProvider =
// class FutureProviderPage extends ConsumerWidget {
//   const FutureProviderPage({this.color, super.key});
//   final Color? color;
//   @override
//   Widget build(BuildContext context, ref) {
//     //watching the exposed by a provider and rebuild the widget when that value changes.
//     final suggestionReference =
//         ref.watch(suggestionFutureProvider("add_any_apiTag"));
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: color,
//         title: const Text("Future Provider"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: RefreshIndicator(
//           onRefresh: () {
//             //.refresh forces a provider to check its state to see if the value is set to the default value
//             //. refresh in this case triggers the Provider to make a new network request indirectly
//             return ref.refresh(suggestionFutureProvider("add_any_apiTag")
//                 .future); //--------try this shiii
//           },
//           child: ListView(
//             children: [
//               Center(
//                 //handle the FutureProvide changes with .when
//                 child: suggestionReference.when(data: ((data) {
//                   return Text(
//                     data.activity!,
//                     style: Theme.of(context).textTheme.headline5,
//                   );
//                 }), error: ((error, _) {
//                   return Text(
//                     error.toString(),
//                     style: Theme.of(context).textTheme.headline5,
//                     textAlign: TextAlign.center,
//                   );
//                 }), loading: () {
//                   return const CircularProgressIndicator();
//                 }),
//               ),
//               const SizedBox(height: 50),
//               Text(
//                 "Pull to refresh in order to see random activity you can do when your bored",
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.bodyText2,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
