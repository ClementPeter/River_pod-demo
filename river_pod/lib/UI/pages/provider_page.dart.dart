import 'package:flutter/material.dart';
import 'package:river_pod/home.dart';

//STEP2 - Create our provider we want to use to pass values in our QApp

class ProviderPage extends StatelessWidget {
  const ProviderPage({this.color, super.key});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body:,
      appBar: AppBar(
        backgroundColor: color,
        title: Text("Provider"),
        centerTitle: true,
      ),
    );
  }
}
