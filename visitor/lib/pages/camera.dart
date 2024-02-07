import 'package:flutter/material.dart';

class Mycamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หัวข้อหรือชื่อ'),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              6,
              (index) => IconButton(
                    icon: Text('${index + 1}'),
                    onPressed: () {/* Handle navigation */},
                  )),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
