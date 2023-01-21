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

//Enum containing Mock cities
enum City {
  stockHolm,
  paris,
  tokyo,
}

typedef WeatherEmoji = String;
//Future to get mock data - to get mock weather data from
Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 2),
    () => {
      City.stockHolm: "❄",
      City.paris: "☔",
      City.tokyo: "⛈",
    }[city]!,
  );
}

//Provides the City ENUM through the App
//UI would be changed by this - State Provider provides the City
//UI Writes to this and reads from this
final currentCityProvider = StateProvider<City?>((ref) {
  return null;
  // return City.stockHolm; //returns the supposed first value to read of the provider
});

const unKnownWeather = "👀";
//WeatheProvider listen to changes from currentCityProvider
//UI reads from this - Future Provider provides the weather data
final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return unKnownWeather;
  }
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text("Weather"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            currentWeather.when(
              data: ((data) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                );
              }),
              loading: (() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const CircularProgressIndicator(),
                );
              }),
              error: ((error, stack) {
                return Text(error.toString());
              }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: City.values.length,
                itemBuilder: (context, index) {
                  final city = City.values[index];
                  final isSelected = city == ref.watch(currentCityProvider);
                  return ListTile(
                    title: Text(city.toString()),
                    trailing: isSelected ? const Icon(Icons.check) : null,
                    onTap: (() {
                      //A provider doesnt really have a state it is notifier that has a state -so we use the notifier to change the state
                      //ONTap assign the  city we sselected to the state of the notifier
                      ref.read(currentCityProvider.notifier).state = city;
                    }),
                  );
                },
              ),
            )
          ],
        ));
  }
}
