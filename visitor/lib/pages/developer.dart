import 'package:flutter/material.dart';


class MyDeveloer extends StatefulWidget {
  const MyDeveloer({super.key});

  @override
  State<MyDeveloer> createState() => _MyDeveloerState();
}

class _MyDeveloerState extends State<MyDeveloer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
          )
        ],
      ), 
    );
  }
}
