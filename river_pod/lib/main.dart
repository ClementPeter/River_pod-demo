import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/home.dart';

/*RIVERPOD-TEMI AJIBOYE*/

// 1. Provider_Page - Default Provider, Read Only
// 2. State_Provider_Page : StateProvider, A type of provider used to update changes in the value
// 3. Future_Provider_Page : Future Provider is used to resolve future based
// 4.
// 5.
// 6.

void main() {
  runApp(
    const
    // STEP 1- For widgets to be able to read providers,
    //we need to wrap the entire application in a "ProviderScope" widget.
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Riverpod Demo'),
    );
  }
}
