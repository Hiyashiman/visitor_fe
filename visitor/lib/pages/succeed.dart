import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor/pages/select_floor.dart';
import 'package:visitor/pages/stepper.dart';

class Pagesucceed extends StatefulWidget {
  const Pagesucceed({Key? key}) : super(key: key);

  @override
  _PagesucceedState createState() => _PagesucceedState();
}

class _PagesucceedState extends State<Pagesucceed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Container(
                height: 150, // Example: Enforce a height constraint
                child: MyStepper(initialStep: 6),
              ),
            ),
            // MyStepper(initialStep: 0),

            const Text("ลงทะเบียนสำเร็จกรุณาดึงบัตรประชาชนออก"),
            const SizedBox(height: 30),
            LottieBuilder.asset(
              'assets/animations/animation.json',
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 30),
            const Text('สแกนหน้าหน้าเข้าอาคารได้เลย'),
            const SizedBox(height: 30),
            // ElevatedButton(
            //   child: const Text('เริ่มรายการ'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const SelectFloor()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
