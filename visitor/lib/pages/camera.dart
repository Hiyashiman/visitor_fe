import 'package:flutter/material.dart';
import 'package:visitor/pages/stepper.dart';

class Mycamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หัวข้อหรือชื่อ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Container(
                height: 150, // Example: Enforce a height constraint
                child: MyStepper(initialStep: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('กรุณาถอดแมส', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
