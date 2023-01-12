import 'package:flutter/material.dart';
import 'package:river_pod/home.dart';


class ChangeNotifierProvider extends StatelessWidget {
  const ChangeNotifierProvider({this.color,super.key});
    final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body:,
        appBar: AppBar(
          backgroundColor: color,
        title: const Text(" Change Notifier Provider"),
        centerTitle: true,
      ),
    );
    
  }
}





