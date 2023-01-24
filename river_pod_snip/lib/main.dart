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
//
//
//
//
//
//
//
//
//
//DEMO APP 2 using StateNotiferProvider
//Building 6 MINI projects with Riverpod and Hooks Riverpod

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

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
/*******/
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
/*******/
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
//
//
//
//
//
//
//
//
// //////////////////////////StateNotifier//////////////////////////
// class Counter extends StateNotifier {
//   Counter() : super(null);

//   void increment() {
//     state = state == null ? 1 : state + 1;
//   }
// }
//
//
//
//
//
//
// //StateNotifierProvider is the provider that allows us to use StateNotifier
// final counterProvider = StateNotifierProvider((ref) {
//   return Counter();
// });

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

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
//DEMO APP 3 Weather App using FutureProvider and StateProvider Mock Data

//Building 6 MINI projects with Riverpod and Hooks Riverpod

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

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

// //Enum containing Mock cities
// enum City {
//   stockHolm,
//   paris,
//   tokyo,
// }

// typedef WeatherEmoji = String;
// //Future to get mock data - to get mock weather data from
// Future<WeatherEmoji> getWeather(City city) {
//   return Future.delayed(
//     const Duration(seconds: 2),
//     () => {
//       City.stockHolm: "❄",
//       City.paris: "☔",
//       City.tokyo: "⛈",
//     }[city]!,
//   );
// }

// /*TWO PROVIDERS DEPENDING ON ONE ANOTHER */
// //UI Writes and reads from to this provider -Provides the City ENUM through the App
// final currentCityProvider = StateProvider<City?>((ref) {
//   return null;
//   // return City.stockHolm; //returns the assumed initial value as "checked" when reading from this provider
// });

// //WeatherProvider listen to changes from currentCityProvider and returns the Future "getWeather" using FutureProvider
// //UI reads from this
// final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
//   final city = ref.watch(currentCityProvider);
//   if (city != null) {
//     return getWeather(city);
//   } else {
//     return "Pick a City 👀";
//   }
// });

// /* */

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //watching the weatherProvider which is of type FutureProvider
//     final currentWeather = ref.watch(weatherProvider);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Weather"),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             //resolving the FutureProvider using .when
//             currentWeather.when(
//               data: ((data) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     data.toString(),
//                     style: const TextStyle(fontSize: 30),
//                   ),
//                 );
//               }),
//               loading: (() {
//                 return const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: CircularProgressIndicator(),
//                 );
//               }),
//               error: ((error, stack) {
//                 return Text(error.toString());
//               }),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: City.values.length,
//                 itemBuilder: (context, index) {
//                   final city = City.values[index];
//                   final isSelected = city == ref.watch(currentCityProvider);
//                   return ListTile(
//                     title: Text(city.toString()),
//                     trailing: isSelected ? const Icon(Icons.check) : null,
//                     onTap: (() {
//                       //A provider doesnt really have a state it is notifier that has a state -so we use the notifier to change the state
//                       //ONTap assign the  city we sselected to the state of the notifier
//                       ref.read(currentCityProvider.notifier).state = city;
//                     }),
//                   );
//                 },
//               ),
//             )
//           ],
//         ));
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
//
//
//
//
//
//
////
////
////
//DEMO APP 4 AutoGenerating list of Name App using StreamProvider

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

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

// //List-Iterable containing names
// List<String> names = [
//   "Jane",
//   "Victoria",
//   "Steph",
//   "Jon",
//   "Drew",
//   "Foden",
//   "Matic",
//   "Monero",
//   "Mali",
//   "Polska",
//   "Talish",
//   "Crev",
//   "Reum",
// ];

// /*TWO STREAMPROVIDERS DEPENDING ON ONE ANOTHER */

// //creating a stream counter that counts each second from 1 to names.length
// final tickerProvider = StreamProvider((ref) {
//   return Stream<int>.periodic(const Duration(seconds: 1), (i) => i + 1);

//   // Stream.periodic(Duration(seconds: 1), (count) => count * count).take(5);
// });

// //nameProvider listens to tickerProvider stream and maps each seconds count to a name []
// final nameProvider = StreamProvider((ref) {
//   return ref
//       .watch(tickerProvider.stream)
//       .map((tick) => names.getRange(0, tick));
// });

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //watching the weatherProvider which is of type FutureProvider

//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Stream Provideer"),
//         centerTitle: true,
//       ),
//       body: name.when(
//         data: (names) {
//           return ListView.builder(
//               itemCount: names.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(names.elementAt(index)),
//                 );
//               });
//         },
//         error: (error, _) {
//           return Card(
//               child:
//                   Center(child: Text("List has gotten to the maximum value")));
//         },
//         loading: () {
//           return const Center(
//             child: CircularProgressIndicator(),
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
//
//
//
////
///
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
//
//
////
///
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
//
//
////
//Personal Demo to create a Filter Search using Riverpod StateNotifier

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/////////////::::::::::::::::::::::::::::::::::::::::////////////
class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

final _products = [
  Product(name: "Iphone", price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'Chocolate', price: 5),
  Product(name: 'Xbox', price: 400),
  Product(name: 'Fruit', price: 5),
  Product(name: 'Vegetable', price: 3),
];

//Riverpod-PROVIDER to provide a list of private product
// final productProvider = Provider<List<Product>>((ref) {
//   //return _products;
//   //for the sorting mechanism
//   final sortType = ref.watch(productSortTypeProvider);
//   //
//   switch(ProductSortType sortType){
//     case ProductSortType.name:
//      return _products.sort

//   }

// });

final productsProvider = Provider<List<Product>>(
  (ref) {
    final sortType = ref.watch(productSortTypeProvider);
    //
    switch (sortType) {
      case ProductSortType.name:
        _products.sort(((a, b) => a.name.compareTo(b.name)));
        return _products;

      case ProductSortType.price:
        _products.sort(((a, b) => a.price.compareTo(b.price)));

        return _products;
    }
  },
);

//Enum used to catergorize what to sort by
enum ProductSortType {
  name,
  price,
}

//Creating a StateProvider from riverpod to sync the state of the dropdown from our enum and "productProvider"
final productSortTypeProvider = StateProvider<ProductSortType>((ref) {
  return ProductSortType.name; //retruns .name on every first instance
});
/////////////::::::::::::::::::::::::::::::::::::::::////////////

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final individualProduct = ref.watch(productsProvider);
    return MaterialApp(
      title: 'Riverpod projects',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("State Provider & Provider"),
          centerTitle: true,
          actions: [
            const SizedBox(width: 30),
            DropdownButton<ProductSortType>(
              // When the sort type changes, this will rebuild the dropdown to update the icon shown.
              //we watch cos we want to also listen to change and update the icon to be shown
              value: ref.watch(productSortTypeProvider),
              onChanged: (value) {
                //We read here cos we want to find out the drop down that was clicked
                //we dont WATCH here cos we dont want to listen to this and listening trigger a rebuild which we dont want
                print(value);
                ref.read(productSortTypeProvider.notifier).state = value!;
              },
              items: const [
                DropdownMenuItem(
                  value: ProductSortType.name,
                  child: Icon(Icons.abc),
                ),
                DropdownMenuItem(
                  value: ProductSortType.price,
                  //  value: ref.read(productSortTypeProvider),
                  child: Icon(Icons.price_change_outlined),
                ),
              ],
              // items:
            ),
            const SizedBox(width: 30)
          ],
        ),
        //Use ListView.builder to populate productProvider "PROVIDER" inside a ListTile
        body: ListView.builder(
          itemCount: individualProduct.length,
          itemBuilder: (BuildContext context, int index) {
            final data = individualProduct[index];
            return ListTile(
              title: Text(data.name),
              trailing: Text("${data.price}"),
            );
          },
        ),
      ),
    );
  }
}


// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final individualProduct = ref.watch(productProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("State Provider & Provider"),
//         centerTitle: true,
//         actions: [
//           const SizedBox(width: 30),
//           DropdownButton<ProductSortType>(
//             // When the sort type changes, this will rebuild the dropdown
//             // to update the icon shown.
//             // value: ref.watch(productSortTypeProvider),
//             // When the user interacts with the dropdown, we update the provider state.
//             onChanged: ((value) {
//               print(value);
//               ref.read(productSortTypeProvider.notifier).state != value;
//             }),

//             items: [
//               // ...
//               DropdownMenuItem(
//                 value: ref.read(productSortTypeProvider),
//                 child: const Icon(Icons.abc),
//               ),
//               DropdownMenuItem(
//                 value: ref.read(productSortTypeProvider),
//                 child: const Icon(Icons.price_change_outlined),
//               ),
//             ],
//           ),
//           // DropdownButton<ProductSortType>(
//           //   // When the sort type changes, this will rebuild the dropdown to update the icon shown.
//           //   value: ref.watch(productSortTypeProvider),
//           //   hint: const Text("Sort by"),

//           //   onChanged: (value) {
//           //     //We read here cos we want to fins out the drop down that was clicked
//           //     //we dont WATCH here cos we dont want to listen to this and listening trigger a rebuild which we dont want
//           //     ref.read(productSortTypeProvider.notifier).state = value!;
//           //   },
//           //   items: [
//           //     DropdownMenuItem(
//           //       value: "",
//           //       child: const Icon(Icons.abc),
//           //     ),
//           // DropdownMenuItem(
//           //   value: "",
//           //   //  value: ref.read(productSortTypeProvider),
//           //   child: const Icon(Icons.price_change_outlined),
//           // ),
//           //   ],
//           //   // items:
//           // ),
//           const SizedBox(width: 30)
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: individualProduct.length,
//         itemBuilder: (BuildContext context, int index) {
//           final data = individualProduct[index];
//           return ListTile(
//             title: Text(data.name),
//             trailing: Text("${data.price}"),
//           );
//         },
//       ),
//     );
//   }
// }
