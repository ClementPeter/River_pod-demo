import 'package:flutter/material.dart';


class FutureProvider extends StatelessWidget {
  const FutureProvider({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Future Provider"),
        centerTitle: true,
      ),
    );
  }
}
