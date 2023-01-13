// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:river_pod/models/suggestion.dart';
// import 'package:river_pod/services/api_service.dart';

// //Create FutureProvider to read the ApiService Provider - autoDispose triggers the ApiServiceProvder to bring new Data
// final suggestionFutureProvider = FutureProvider<Suggestion>((ref) {
//   final apiService = ref.watch(apiServiceProvider);
//   return apiService.getSuggestion();
// });

// //final suggestionFutureProvider =
// class FutureProviderPage extends ConsumerWidget {
//   const FutureProviderPage({this.color, super.key});
//   final Color? color;
//   @override
//   Widget build(BuildContext context, ref) {
//     //watching the exposed by a provider and rebuild the widget when that value changes.
//     final suggestionReference = ref.watch(suggestionFutureProvider);
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
//             return ref.refresh(suggestionFutureProvider.future);
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
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
