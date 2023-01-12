import 'package:flutter/material.dart';
import 'package:river_pod/home.dart';

class StateProviderPage extends StatelessWidget {
  const StateProviderPage({this.color, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text("State Provider"),
        centerTitle: true,
      ),
    );
  }
}
