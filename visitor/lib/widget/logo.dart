import 'package:flutter/material.dart';


class MyLogo extends StatefulWidget {
  const MyLogo({super.key});

  @override
  State<MyLogo> createState() => _MyLogoState();
}

class _MyLogoState extends State<MyLogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: 150,
            height: 100,
            color: Colors.black,
            alignment: Alignment.topRight,
          )
        ],
      ), 
    );
  }
}
