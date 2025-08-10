import 'package:flutter/material.dart';
import 'package:river_pod/views/pages/change_notifier_provider_page.dart.dart';
import 'package:river_pod/views/pages/future_provider_page.dart.dart';
import 'package:river_pod/views/pages/provider_page.dart.dart';
import 'package:river_pod/views/pages/state_notifier_provider_page.dart.dart';
import 'package:river_pod/views/pages/state_provider_page.dart.dart';
import 'package:river_pod/views/pages/stream_provider_page.dart.dart';
import 'package:river_pod/views/widgets/reusableButton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            ReusableButton(
              text: "Provider",
              color: Colors.amber,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProviderPage(
                        color: Colors.amber,
                      );
                    },
                  ),
                );

                // MaterialPageRoute(
                //     builder: (context) => Navigator.push(BuildContext, Ma));
              },
            ),
            const SizedBox(height: 10),
            ReusableButton(
              text: "State Provider",
              color: Colors.blue,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const StateProviderPage(
                        color: Colors.blue,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ReusableButton(
              text: "Future Provider",
              color: Colors.red,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FutureProviderPage(
                        color: Colors.red,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ReusableButton(
              text: "Stream Provider",
              color: Colors.green,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const StreamProviderPage(
                        color: Colors.green,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ReusableButton(
              text: "Change Notifier Provider",
              color: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangeNotifierProviderPage(
                        color: Colors.black,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ReusableButton(
              text: "State Notifier Provider",
              color: Colors.purple,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const StateNotifierProviderPage(
                        color: Colors.purple,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
