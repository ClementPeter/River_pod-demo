import 'package:flutter/material.dart';

class ChangeNotifierProviderPage extends StatelessWidget {
  const ChangeNotifierProviderPage({this.color, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text(" Change Notifier Provider"),
        centerTitle: true,
      ),
    );
  }
}
