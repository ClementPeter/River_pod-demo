import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//STEP2 - Create our PROVIDER ; provider that creates read only value
//pass datatype and value we want to reference or pass around in our App

// final valueProvider = Provider<int>((ref) => 42);

// class ProviderPage extends StatelessWidget {
//   const ProviderPage({this.color, super.key});

//   final Color? color;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: color,
//         title: const Text("Provider"),
//         centerTitle: true,
//       ),
//       //STEP 3 Read provider value using Consumer widget
//       body: Consumer(
//         builder: (context, ref, child) {
//           return Center(
//             child: Text(
//               "This is the value in the provider ${ref.watch(valueProvider)}",
//               style: Theme.of(context).textTheme.headline5,
//             ),

//           );
//         },
//       ),
//     );
//   }
// }


//Another way of Reading PROVIDER Value using "CONSUMER WIDGET" - wrap the provider with Consumer


//STEP2 - Create our PROVIDER ; provider that creates read only value
//pass datatype and value we want to reference or pass around in our App

final valueProvider = Provider<int>((ref) => 42);


class ProviderPage extends ConsumerWidget {
  const ProviderPage({this.color, super.key});
  final Color? color;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Provider"),
        centerTitle: true,
      ),
      //STEP 3 Read provider value using Consumer widget
      body: Center(
        child: Text(
          "This is the value in the provider ${ref.watch(valueProvider)}",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
