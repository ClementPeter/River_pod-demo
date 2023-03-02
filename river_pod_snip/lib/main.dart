// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

////Building 7 MINI projects with Riverpod and Hooks Riverpod

//To run the project properly ;
/*Be aware that individual projects are separated by the LONG COMMENT
  and short comment are just for Formatting GAPS to avoid congestion
  */

// UNCOMMENT ONE PROJECT AT A TIME TO AVOID ERRORS !

//::::::PROJECT 1::::::Show current Time using PROVIDER from Riverpod
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
//       home: const HomePage(),
//     );
//   }
// }

// final currentDateProvider = Provider<DateTime>((ref) {
//   return DateTime.now();
// });

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

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
////::::::PROJECT 2::::::DEMO APP 2 using StateNotiferProvider
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
//       home: const HomePage(),
//     );
//   }
// }
/****NOT IN USE***/
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
/****NOT IN USE***/

/***UNCOMMENT FROM BELOW HERE****/
//
//
//

//////////////////////////StateNotifier Class and StateNotifierProvider  - USED TO UPDATE State//////////////////////////
// class Counter extends StateNotifier {
//   //We first need to pass an initial value to the super constructor, to define the initial state of our object.
//   Counter() : super(null);

//   void increment() {
//     state = state == null ? 1 : state + 1;
//   }
// }

// //StateNotifierProvider is the provider that allows us to access and use StateNotifier
// final counterProvider = StateNotifierProvider((ref) {
//   return Counter();
// });

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

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

// // DEMO APP 3 Mock Weather App using FutureProvider and StateProvider Mock Data
// // Building 6 MINI projects with Riverpod and Hooks Riverpod

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
//       home: const HomePage(),
//     );
//   }
// }

// //Enum containing Mock cities
// enum City {
//   stockHolm,
//   paris,
//   tokyo,
// }

// typedef WeatherEmoji = String; //TypeDef helps the Code to see WeatherEmoji as a String
// //Future to get mock data - weather Emoji serves a s String that actually returns "emojis"
// Future<WeatherEmoji> getWeather(City city) {
//   return Future.delayed(
//     const Duration(seconds: 2),
//     () => {
//       City.stockHolm: "❄",
//       City.paris: "☔",
//       City.tokyo: "⛈",
//     }[city]!, //unwrap the value from the map
//   );
// }

// /*TWO PROVIDERS DEPENDING ON ONE ANOTHER */
// //UI Writes and reads from to this provider
// //States Provider hold & Provides the City ENUM through the App that is mutable(manipulated by UI)

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

// ////* *//



// //// APP BODY //
// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

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
//                       //On Tap assign the  city we selected to the state of the notifier
//                       //.read get a snapshot of the provider and pass the selected city
//                       ref.read(currentCityProvider.notifier).state = city;
//                     }),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),);
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
//       home: const HomePage(),
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

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

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
//
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
//DEMO APP 5
//::::::PROJECT 5::::::Item Demo to create a Filter Search using Riverpod StateNotifier

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// /////////////::::::::::::::::::::::::::::::::::::::::////////////
// class Product {
//   Product({required this.name, required this.price});

//   final String name;
//   final double price;
// }

// final _products = [
//   Product(name: "Iphone", price: 999),
//   Product(name: 'cookie', price: 2),
//   Product(name: 'ps5', price: 500),
//   Product(name: 'Chocolate', price: 5),
//   Product(name: 'Xbox', price: 400),
//   Product(name: 'Fruit', price: 5),
//   Product(name: 'Vegetable', price: 3),
// ];

// //Riverpod-PROVIDER to provide a sorted list of product based on the selected dropdown
// final productsProvider = Provider(
//   (ref) {
//     //return _products;

//     /*for the sorting mechanism*/
//     //watching the enum provider
//     final sortType = ref.watch(productSortTypeProvider);
//     //
//     switch (sortType) {
//       case ProductSortType.name:
//         _products.sort(((a, b) => a.name.compareTo(b.name)));
//         return _products;

//       case ProductSortType.price:
//         return _products
//           ..sort(
//             ((a, b) => a.price.compareTo(b.price)),
//           ); //Same as above but using cascade operator
//     }
//   },
// );

// //Enum used to catergorize what to sort by
// enum ProductSortType {
//   name,
//   price,
// }

// //Creating a StateProvider with riverpod to sync the state of the dropdown button from our productSortTypeProvider enum
// //StateProvider providing the current eum value for the "ProductSortType"

// final productSortTypeProvider = StateProvider<ProductSortType>((ref) {
//   return ProductSortType.name; //retruns "name" enum on every first instance
// });
// /////////////::::::::::::::::::::::::::::::::::::::::////////////

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final individualProduct = ref.watch(productsProvider);
//     return MaterialApp(
//       title: 'Riverpod projects',
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Cart Filter"),
//           centerTitle: true,
//           actions: [
//             const SizedBox(width: 30),
//             DropdownButton<ProductSortType>(
//               // When the sort type changes, this will rebuild the dropdown to update the icon shown.
//               //we "watch" because we want to also listen to change and update the icon to be shown
//               value: ref.watch(productSortTypeProvider),
//               onChanged: (value) {
//                 //We read here because we want to find out the drop down that was clicked
//                 //we dont WATCH here because we dont want to listen to this and listening triggers a rebuild of our "build method"  which we dont want
//                 print(value);
//                 ref.read(productSortTypeProvider.notifier).state = value!;
//               },
//               items: const [
//                 DropdownMenuItem(
//                   value: ProductSortType.name,
//                   child: Icon(Icons.abc),
//                 ),
//                 DropdownMenuItem(
//                   value: ProductSortType.price,
//                   child: Icon(Icons.price_change_outlined),
//                 ),
//               ],
//               // items:
//             ),
//             const SizedBox(width: 30)
//           ],
//         ),
//         //Use ListView.builder to populate productProvider "PROVIDER" inside a ListTile
//         body: ListView.builder(
//           itemCount: individualProduct.length,
//           itemBuilder: (BuildContext context, int index) {
//             final data = individualProduct[index];
//             return ListTile(
//               title: Text(data.name),
//               trailing: Text("${data.price}"),
//             );
//           },
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
// // DEMO Example 5 Name and Age App
// import 'dart:collection';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:uuid/uuid.dart';

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
//       home: const HomePage(),
//     );
//   }
// }

// //Not wrappping myApp with consumer is cos we only want to rebuild selected parts in our App
// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("HomePage"),
//         centerTitle: true,
//       ),
//       //
//       body: Consumer(
//         builder: (BuildContext context, WidgetRef ref, Widget? child) {
//           //
//           final dataModel = ref.watch(ItemModelProvider);
//           return ListView.builder(
//             itemCount: dataModel.count,
//             itemBuilder: (context, index) {
//               final item = dataModel.people[index];
//               return ListTile(
//                 title: GestureDetector(
//                   onTap: () async {
//                     //Updating the inventory on click of the the ListTile
//                     final updatedItem = await createOrUpdateItemDialog(
//                       context,
//                       item,
//                     );

//                     if (updatedItem != null) {
//                       dataModel.update(updatedItem);
//                     }
//                   },
//                   child: Text(
//                     item.displayName,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final item = await createOrUpdateItemDialog(context);
//           //print(item);
//           if (item != null) {
//             //check if this is necessary - needed to create a refeerence for ItemModelProvider ChangeNotifier
//             final dataModel = ref.read(ItemModelProvider);
//             dataModel.add(item);
//           }
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// //creating an immutable class
// @immutable
// class Item {
//   final String? name;
//   final int? age;
//   final String? uuid;

//   Item({
//     required this.name,
//     required this.age,
//     String? uuid,
//   }) : uuid = uuid ?? const Uuid().v4();

//   //function used to update name and age
//   Item updated([String? name, int? age]) => Item(
//         name: name ?? this.name,
//         age: age ?? this.age,
//         uuid: uuid,
//       );

//   String get displayName => "$name $age year(s) old";

//   //  //to make sure the object is unique
//   //   @override
//   //   bool operator ==(Object other) {
//   //     if (identical(this, other)) return true;

//   //     return other is Item &&
//   //       other.uuid == uuid;
//   //   }
//   //create an equatable to check the hash
//   @override
//   bool operator ==(covariant Item other) => uuid == other.uuid;

//   @override
//   int get hashCode => uuid.hashCode;

//   //the toString method
//   @override
//   String toString() =>
//       "Item(name: $name, age: $age, uuid: $uuid,)"; //check if this is necessary
// }

// //ChangeNotifierProvider to provide the Data Model class through our app
// final ItemModelProvider = ChangeNotifierProvider((ref) {
//   return DataModel();
// });

// //Creating the class our ChangeNotifier would listen to - this class would interact with Item Class to add and update  items
// class DataModel extends ChangeNotifier {
//   final List<Item> _item = []; //Hold the list of Indivicual Item Objects
//   int get count => _item.length;

//   //Exposing the List so that it cant be changed
//   UnmodifiableListView<Item> get people => UnmodifiableListView(_item);

//   //Add a item to the List
//   void add(Item item) {
//     _item.add(item);
//     notifyListeners();
//   }

// //Modify and existing Item in a List
//   void update(Item updatedItem) {
//     //before we update a item we check if the item already exist in the _item List
//     //finds the index item we want to update
//     final index = _item.indexOf(updatedItem);
//     final oldItem = _item[index]; //get the actual  item we want to update

//     //compare the new values of the item with the old values of the item then modify the old
//     if (oldItem.name != updatedItem.name ||
//         oldItem.age != updatedItem.age) {
//       _item[index] = oldItem.updated(updatedItem.name, updatedItem.age);
//       notifyListeners();
//     }
//   }
// }

// /////***********Creating Dialog to be called by FAB ***********/////////
// //showDialog needs ctx and existing item is needed when we need to update a item

// //
// //textfield controllers
// //issue found
// // TextEditingController itemNameController = TextEditingController();
// // TextEditingController itemNumberController = TextEditingController();

// final nameController = TextEditingController(); //issue fixed
// final ageController = TextEditingController();

// Future<Item?> createOrUpdateItemDialog(
//   BuildContext context, [
//   Item? existingItem,
// ]) {
//   //Holds the value from Onchanged coming from text fields
//   String? name = existingItem?.name;
//   int? age = existingItem?.age;

//   //update the textfield controller with the existing values of name and age if we have it
//   // - Does the AutoFill if user exist alreadt
//   nameController.text = name ?? "";
//   ageController.text = age?.toString() ?? "";

//   return showDialog<Item?>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Create a Item"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(hintText: "Enter name here"),
//                 onChanged: ((value) {
//                   name = value; //pass the value from text field into name
//                 }),
//               ),
//               TextField(
//                 controller: ageController,
//                 decoration: const InputDecoration(hintText: "Enter age here"),
//                 onChanged: ((value) {
//                   age = int.tryParse(value);
//                 }),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               child: const Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text("Save"),
//               onPressed: () {
//                 //save when both textfield are filled
//                 if (name != null && age != null) {
//                   //if there is an existing item
//                   if (existingItem != null) {
//                     print(
//                         ":::::::::::::::::::::::::::::::::::::$existingItem");
//                     final newItem = existingItem.updated(name, age);
//                     Navigator.of(context).pop(newItem);
//                     // Navigator.pop(context, newItem);
//                   } else {
//                     //Navigator.pop(context, Item(name: name, age: age));
//                     Navigator.of(context).pop(Item(name: name, age: age));
//                   }
//                   //  Navigator.of(context).pop(Item(name: name, age: age));
//                   // Navigator.of(context).push(Item(name: name, age: age));
//                 } else {
//                   //show a prompt
//                   //Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       duration: Duration(seconds: 1),
//                       backgroundColor: Colors.red,
//                       content: Text("Fill in the fields"),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         );
//       });
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

// // // DEMO Personal Project Clone INVENTORY APP
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemModel = ref.watch(ItemModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: itemModel.itemAmount,
        itemBuilder: ((context, index) {
          final item = itemModel.item[index];
          //print(item);
          return ListTile(
            title: GestureDetector(
              onTap: () async {
                //pass the item -"updated data" from the dialog
                final updatedItem =
                    await createOrUpdateItemDialog(context, item);
                if (updatedItem != null) {
                  itemModel.update(updatedItem);
                }
              },
              child: Text(item.displayName),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final item = await createOrUpdateItemDialog(context);
          print("::::::::::::::::::::::::::::$item");
          //verify then update the ChangeNotifierProvider

          //if item is avaible add it to the List
          if (item != null) {
            //we read cos we need to get a snapshot of what is in the list already
            final dataModel = ref.read(ItemModelProvider);
            dataModel.add(item);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ///
// //
// //
// //
// //
// //

// class to for creation of Items
@immutable
class Item {
  final String name;
  final int unit;
  final String uuid;

  Item({required this.name, required this.unit, String? uuid})
      : uuid = uuid ?? const Uuid().v4();

  //function to update an item - A subtype of the Parent class
  Item updated([String? name, int? unit]) => Item(
        name: name ?? this.name,
        unit: unit ?? this.unit,
        uuid: uuid,
      );

  //get the display UI name
  String get displayName => "$name $unit unit(s)";

  //to compare and make sure the object is unique - NECCESSARY : helps us to update stuff
  //the operator checks the uuid property of the "other" object to see if its equal to the object being compared too
  //covariant specifies that the "other" can be a subtype of the object being compared - "ChatGPT"

  @override
  bool operator ==(covariant Item other) => uuid == other.uuid;

  //needed by the compare operator
  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  // @override
  // int get hashcode => uuid.hashCode;

  //check if this is necessary - NOT NECESSARY
  //returning to String method for debugging, logging or display purposes

  //@override
  //String toString() => "Item(name: $name, unit: $unit, uuid : $uuid)";

}

///************************************//

//ChangeNotifierProvider to pass data mutable data through our App / interact with the ItemDataModel
final ItemModelProvider = ChangeNotifierProvider<ItemDataModel>((ref) {
  return ItemDataModel();
});

//ChangeNotifier class to help us add and modify to our List
class ItemDataModel extends ChangeNotifier {
  //Hold the list of Individual Item Objects

  final List<Item> _item = [
    Item(name: "Rifle", unit: 20),
  ];

  int get itemAmount => _item.length;

  //getter for the List that cant be modified but can be added too
  UnmodifiableListView get item => UnmodifiableListView(_item);

  //Add a item to the List
  void add(Item item) {
    _item.add(item);
    //print("from add funtion::::::::::::::::::::::::::::::::::::::::::::$_item");
    notifyListeners();
  }

  void update(Item updatedItem) {
    //To update an item we have check if the item exist to first locate the item
    //Get the Index - Check the "item" List to see if the passed item has been indexed already
    //returns a number as the "index"
    final index = _item.indexOf(updatedItem);
    //get the item from the index
    final oldItem = _item[index];

    //compare both values -then update the previous value
    if (oldItem.name != updatedItem.name || oldItem.unit != updatedItem.unit) {
      _item[index] = oldItem.updated(
        updatedItem.name,
        updatedItem.unit,
      );
      notifyListeners();
    }
  }
}

//*******************************************************//

//creating the dialog function used by the ListTile and FAB
final nameController = TextEditingController();
final unitController = TextEditingController();

//showDialog needs ctx and
//also existing item is needed when we need to update a item via the ListTile
Future<Item?> createOrUpdateItemDialog(BuildContext context,
    [Item? existingItem]) {
  //Holds the value from Onchanged coming from text fields
  String? name = existingItem?.name;
  int? unit = existingItem?.unit;

  //Assigning values to the controllers
  nameController.text = name ?? "";
  unitController.text = unit?.toString() ?? "";

  return showDialog<Item?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Enter name here"),
                onChanged: ((value) {
                  name = value; //pass the value from text field into name
                }),
              ),
              TextField(
                controller: unitController,
                decoration: const InputDecoration(
                    hintText: "Enter amount of items here"),
                onChanged: ((value) {
                  unit = int.tryParse(value);
                }),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                //verify text fields are not empty before saving
                if (name != null && unit != null) {
                  //pass in the values directly to pop the scren
                  // Navigator.of(context).pop(Item(name: name!, unit: unit!));
                  if (existingItem != null) {
                    //if an item existed ; update it
                    final newItem = existingItem.updated(
                      name,
                      unit,
                    );
                    Navigator.of(context).pop(newItem);
                  } else {
                    Navigator.of(context).pop(Item(name: name!, unit: unit!));
                    //or longer route - uncomment this
                    //print(":::::::::::::::::::::::::::::$newItem");
                    //final newItem = Item(name: name!, unit: unit!);
                    //Navigator.of(context).pop(newItem);

                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.red,
                      content: Text("Fill in the fields"),
                    ),
                  );
                  // Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      });
}




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

////::::::PROJECT 6 - LAST ::::::Demo to create a Movie Filter Search using Riverpod StateNotifier

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// //::::::::::::::::::LOGIC ::::::::::::::::::::::://

// //@immutable
// class Film {
//   final String? id;
//   final String? title;
//   final String? description;
//   final bool isFavourite;

//   const Film({
//      this.id,
//      this.title,
//      this.description,
//     required this.isFavourite,
//   });

//   //copy function to change the content in favourite
//   Film copyWith({required bool isFavourite}) => Film(
//         id: id,
//         title: title,
//         description: description,
//         isFavourite: isFavourite,
//       );

//   //create toString override
//   @override
//   String toString() {
//     return 'Film(id: $id, title: $title, description: $description, isFavourite: $isFavourite)';
//   }

//   bool operator ==(covariant Film other) =>
//       id == other.id && isFavourite == other.isFavourite;

//   @override
//   // TODO: implement hashCode
//   int get hashCode => super.hashCode;

//   // @override
//   // int get hashCode => Object.hashAll([id, isFavourite]);
// }

// //List of Films
// const allFilms = [
//   Film(
//     id: "1",
//     title: "Movie 1",
//     description: "Movie 1 Description",
//     isFavourite: false,
//   ),
//   Film(
//     id: "2",
//     title: "Movie 2",
//     description: "Movie 2 Description",
//     isFavourite: false,
//   ),
//   Film(
//     id: "3",
//     title: "Movie 3",
//     description: "Movie 3 Description",
//     isFavourite: false,
//   ),
//   Film(
//     id: "4",
//     title: "Movie 4",
//     description: "Movie 4 Description",
//     isFavourite: false,
//   ),
//   Film(
//     id: "5",
//     title: "Movie 5",
//     description: "Movie 5 Description",
//     isFavourite: false,
//   ),
// ];

// //Films Notifier modifies the state of the "allFilms" List using StateNotifer
// class FilmsNotifier extends StateNotifier<List<Film>> {
//   FilmsNotifier() : super(allFilms);

//   void update(Film film, bool isFavourite) {
//     //check through the contents in the state and if the id is the same
//     //in order to replace it in "state" which is  a List of things

//     state = state.map(
//       (thisFilm) => thisFilm.id == film.id
//         ? thisFilm.copyWith(isFavourite: isFavourite)
//         : thisFilm
//     ).toList();

     
//   }
// }

// final allFilmsProvider =
//     StateNotifierProvider<FilmsNotifier, List<Film>>((ref) => FilmsNotifier());

// //Watching allFilmsProvider to get the selected favourites and non favourites from allFilmsProvider
// final favoriteFilmProvider = Provider<Iterable<Film>>(
//   (ref) => ref.watch(allFilmsProvider).where((film) => film.isFavourite),
// );

// final notfavoriteFilmProvider = Provider<Iterable<Film>>(
//     (ref) => ref.watch(allFilmsProvider).where((film) => !film.isFavourite));

// ///////Enums for DropDownMenu items
// enum FavouriteStatus {
//   all,
//   favourite,
//   notFavourite,
// }

// //Provider for the DropDownMenu - StateProvider
// final favouriteStatusProvider = StateProvider<FavouriteStatus>((ref) {
//   return FavouriteStatus.all;
// });

// //Creating Widget subcomponent for the Dropdown filter and Movie content ListView

// //FilmList would depend on 2 PROVIDERS (favoriteFilmProvider & notfavoriteFilmProvider) to change state
// class FilmList extends ConsumerWidget {
//   //To pass a provider to a class it has to be of type AlwaysAliveProviderBase
//   final AlwaysAliveProviderBase<Iterable<Film>> provider;

//   const FilmList({required this.provider, super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final films = ref.watch(provider);
//     return Expanded(
//       child: ListView.builder(
//         itemCount: films.length,
//         itemBuilder: ((context, index) {
//           final film = films.elementAt(index);
//           final favouriteIcon = film.isFavourite
//               ? const Icon(Icons.favorite)
//               : const Icon(Icons.favorite_border);
//           return ListTile(
//             title: Text(film.id!),
//             subtitle: Text(film.description!
//             ),
//             trailing: IconButton(
//               icon: favouriteIcon,
//               onPressed: () {
//                 final isFavourite = !film.isFavourite;
//                 //onpress of this button we want to notify the FilmsNotifier
//                 // but we have to do that through the "allFilmsProvider" StateNotifierProvider
//                 //- NECESSARY
//                 ref.read(allFilmsProvider.notifier).update(film, isFavourite);
//               },
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// //FilterWidget would depend on 1 PROVIDER (favouriteStatusProvider) to change its state
// class FilterWidget extends ConsumerWidget {
//   const FilterWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Consumer(builder: (context, WidgetRef ref, child) {
//       return DropdownButton(
//         value: ref.watch(favouriteStatusProvider),
//         onChanged: (value) {
//           ref.read(favouriteStatusProvider.notifier).state =
//               value!; ///////////////////////////CHECK - works with notifier
//         },
//         //mapping Enums values to DropdownMenuItem
//         items: FavouriteStatus.values
//             .map(
//               (status) => DropdownMenuItem(
//                 value: status,
//                 child: Text(status.toString().split(".").last),
//               ),
//             )
//             .toList(),
//       );
//     });
//   }
// }

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
//       home: const HomePage(),
//     );
//   }
// }
// //
// //
// //
// //
// //::::::::::::::::::MAIN APP BODY ::::::::::::::::::::::://

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //final currentDate = ref.watch(currentDateProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hooks Riverpod"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const FilterWidget(),
//           Consumer(
//             builder: (context, ref, child) {
//               final filter = ref.watch(favouriteStatusProvider);
//               switch (filter) {
//                 case FavouriteStatus.all:
//                   return FilmList(provider: allFilmsProvider);
//                 case FavouriteStatus.favourite:
//                   return FilmList(provider: favoriteFilmProvider);
//                 case FavouriteStatus.notFavourite:
//                   return FilmList(provider: notfavoriteFilmProvider);
//               }
//               //  return ;
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
