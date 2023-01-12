import 'package:flutter/material.dart';
import 'package:river_pod/home.dart';

class StreamProvider extends StatelessWidget {
  const StreamProvider({this.color, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text("Stream Provider"),
        centerTitle: true,
      ),
    );
  }
}
