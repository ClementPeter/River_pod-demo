// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// //Building 6 MINI projects with Riverpod and Hooks Riverpod

// void main() {
//   runApp(
//     ProviderScope(
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Riverpod projects',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// final currentDateProvider = Provider<DateTime>((ref) {
//   return DateTime.now();
// });

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentDate = ref.watch(currentDateProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hooks Riverpod projects"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               currentDate.toIso8601String(),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             //button
//             ElevatedButton(
//               onPressed: (() {
//                 ref.refresh(currentDateProvider);
//               }),
//               child: const Text("Refresh"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //DEMO APP 2 using StateNotiifereProvider

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// //Building 6 MINI projects with Riverpod and Hooks Riverpod

// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Riverpod projects',
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// // //extension called OptionalInFixAddition to add null and non-null values
// // extension OptionalInfixAddition<T extends num> on T? {
// //   T? operator +(T? other) {
// //     final shadow = this;
// //     if (shadow != null) {
// //       return shadow + (other ?? 0) as T;
// //     } else {
// //       return null;
// //     }
// //   }
// // }

// //function to add a null and  non-null variable using extensions
// // void testIt() {
// //   final int? int1 = 1;
// //   final int? int2 = 1;
// //   final result = int1 + int2;
// //   print(result);
// // }
// //////////////////////////StateNotifier//////////////////////////
// class Counter extends StateNotifier {
//   Counter() : super(null);

//   void increment() {
//     state = state == null ? 1 : state + 1;
//   }
// }
// //StateNotifierProvider is the provider that allows us to use StateNotifier
// final counterProvider = StateNotifierProvider((ref) {
//   return Counter();
// });

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //fina
//     // testIt();
//     return Scaffold(
//       appBar: AppBar(
//         //Wrap the text in Consumer widget prevents us from using the parent "ref" which rebuilds
//         //the entire scaffold when the counter value changes
//         title: Consumer(
//           builder: ((context, ref, child) {
//             final counter = ref.watch(counterProvider);
//             final text = counter == null ? "Press to begin" : "$counter";

//             return Text(text);
//           }),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             //text button
//             TextButton(
//               // onPressed: (() {
//               //   ref.read(counterProvider.notifier).increment();
//               // }),
//               onPressed: ref.read(counterProvider.notifier).increment,

//               child: const Text("Increment"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




/////////DEMO APP 3 Weather App using FutureProvider and Mock Data
/////DEMO APP 2 using StateNotiifereProvider

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Building 6 MINI projects with Riverpod and Hooks Riverpod

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod projects',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// // //extension called OptionalInFixAddition to add null and non-null values
// // extension OptionalInfixAddition<T extends num> on T? {
// //   T? operator +(T? other) {
// //     final shadow = this;
// //     if (shadow != null) {
// //       return shadow + (other ?? 0) as T;
// //     } else {
// //       return null;
// //     }
// //   }
// // }

// //function to add a null and  non-null variable using extensions
// // void testIt() {
// //   final int? int1 = 1;
// //   final int? int2 = 1;
// //   final result = int1 + int2;
// //   print(result);
// // }
// //////////////////////////StateNotifier//////////////////////////
// class Counter extends StateNotifier {
//   Counter() : super(null);

//   void increment() {
//     state = state == null ? 1 : state + 1;
//   }
// }
// //StateNotifierProvider is the provider that allows us to use StateNotifier
// final counterProvider = StateNotifierProvider((ref) {
//   return Counter();
// });

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //fina
    // testIt();
    return Scaffold(
      appBar: AppBar(
        //Wrap the text in Consumer widget prevents us from using the parent "ref" which rebuilds
        //the entire scaffold when the counter value changes
        title:Text("Weather"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //text button
       
          ],
        ),
      ),
    );
  }
}

