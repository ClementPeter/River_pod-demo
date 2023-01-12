import 'package:flutter/material.dart';
import 'package:river_pod/home.dart';

class FutureProvider extends StatelessWidget {
  const FutureProvider({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body:,
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Future Provider"),
        centerTitle: true,
      ),
    );
  }
}
