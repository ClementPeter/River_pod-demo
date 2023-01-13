import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//STATEPROVIDER : a type of provider used to update changes in the value
// final valueStateProvider = StateProvider(((ref) => 50));

// class StateProviderPage extends StatelessWidget {
//   const StateProviderPage({this.color, super.key});
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: color,
//         title: Text("State Provider"),
//         centerTitle: true,
//       ),
//       body: Consumer(builder: (BuildContext context, WidgetRef ref, child) {
//         return Center(
//           child: Text("This is the value from State Provider ${ref.watch(valueStateProvider)} and it can be updated since the provider type is of STATEPROVIDER") ,
//         )
//       },),
//     );

//   }
// }

//Better/ Preferred way of passing value to STATEPROVIDER - by extending ConsumerWidget
//STATEPROVIDER : a type of provider used to update changes in the value
//add AUTODISPOSE to refresh the provider on screen pop to default value of the provider
final valueStateProvider = StateProvider.autoDispose<int>(((ref) => 50));

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({this.color, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
        valueStateProvider); //returns the value by the provider and rebuild if the value changes

    //.LISTEN : method to listening to provider help and perfomm specific action based on listend value

    ref.listen<int>(valueStateProvider, (previous, current) {
      if (current == 65) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The provider is listening and the value is 65"),
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
        children: [
          Center(
            child: Text(
              "This is the value from State Provider is $value and the value can be updated since the provider type is of STATE PROVIDER",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          //Incrementing Counter and reading the provider
          ElevatedButton(
            onPressed: () {
              ref.read(valueStateProvider.notifier).state++;
            },
            child: const Text("Increment"),
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
