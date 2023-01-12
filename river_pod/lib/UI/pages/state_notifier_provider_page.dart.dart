import 'package:flutter/material.dart';
import 'package:river_pod/home.dart';

class StateNotifierProviderPage extends StatelessWidget {
  const StateNotifierProviderPage({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text("State Notifier Provider"),
        centerTitle: true,
      ),
    );
  }
}
