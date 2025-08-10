import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// //STATEPROVIDER : a type of provider used to update changes in the value
// final valueStateProvider = StateProvider(((ref) => 50));

// class StateProviderPage extends StatelessWidget {
//   const StateProviderPage({this.color, super.key});
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: color,
//         title: const Text("State Provider"),
//         centerTitle: true,
//       ),
//       body: Consumer(
//         builder: (BuildContext context, WidgetRef ref, child) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Demo of STATE PROVIDER alongside methods like .read .invalidate ',
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   "This is the value from State Provider ${ref.watch(valueStateProvider)} and it can be updated since the provider type is of STATEPROVIDER",
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.headline5,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(valueStateProvider.notifier).state++;
//                 },
//                 child: const Text("Increment"),
//               ),
//               const SizedBox(height: 20),
//               //Decrementing Counter and reading the provider with notifier and state--
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(valueStateProvider.notifier).state--;
//                 },
//                 child: const Text("Decrement"),
//               ),
//               const SizedBox(height: 20),
//               //ref.invalidate helps to refresh the provider to the default value
//               ElevatedButton(
//                 onPressed: () {
//                   ref.invalidate(valueStateProvider);
//                 },
//                 child: const Text("Invalidate"),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

//
//
//
//
//
//
//
//
//
//

// //Better/ Preferred way of passing value to STATEPROVIDER - by extending ConsumerWidget

// //STATEPROVIDER : a type of provider used to update changes in the value
// //add .AUTODISPOSE to refresh the provider on screen pop to default value of the provider
//
//
final valueStateProvider = StateProvider.autoDispose<int>(((ref) => 50));

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({this.color, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //.watch : returns the value by the provider and rebuild if the value changes
    final value = ref.watch(valueStateProvider);

    //.read : literally reads the set value in the provider and does not update the UI
    //final value = ref.read(valueStateProvider);

    //.LISTEN : method to listen to provider help and perform specific action based on listened value

    ref.listen<int>(valueStateProvider, (previous, current) {
      if (current == 55) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The provider is listening and the value is 55"),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("State Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Demo of STATE PROVIDER alongside methods like .read .invalidate .listen',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "This is the value from State Provider \n $value \n and the value can be updated since the provider type is of STATE PROVIDER",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "AUTOFOCUS makes the STATE PROVIDER refresh to the default on screen pop",
            textAlign: TextAlign.center,
            // style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 20),
          const Text(
            ".listen makes the STATE PROVIDER listen and perform and event based on the state provider value",
            textAlign: TextAlign.center,
            // style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 20),
          //Incrementing Counter and reading the provider with notifier and state++
          ElevatedButton(
            onPressed: () {
              ref.read(valueStateProvider.notifier).state++;
            },
            child: const Text("Increment"),
          ),
          const SizedBox(height: 20),
          //Decrementing Counter and reading the provider with notifier and state--
          ElevatedButton(
            onPressed: () {
              ref.read(valueStateProvider.notifier).state--;
            },
            child: const Text("Decrement"),
          ),
          const SizedBox(height: 20),
          //ref.invalidate helps to refresh the provider to the default value
          ElevatedButton(
            onPressed: () {
              ref.invalidate(valueStateProvider);
            },
            child: const Text("Invalidate"),
          )
        ],
      ),
    );
  }
}
