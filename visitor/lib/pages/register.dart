import 'package:flutter/material.dart';
import 'package:visitor/pages/select_floor.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Routeeeqqqe'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('เริ่มรายการ'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SelectFloor()),
            );
          },
        ),
      ),
    );
  }
}
