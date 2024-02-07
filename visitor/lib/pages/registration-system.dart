import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor/pages/select_floor.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // MyStepper(initialStep: 0),
            const Text("ระบบลงทะเบียนเข้าอาคารด้วยตนเอง"),
            const SizedBox(height: 30),
            LottieBuilder.asset(
              'assets/animations/animation.json',
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 30),
            const Text('กรุณาเสียบบัตรประชาชน'),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('เริ่มรายการ'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectFloor()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
