import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/home.dart';

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
      title: 'Riverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Riverpod Demo'),
    );
  }
}
