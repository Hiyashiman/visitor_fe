import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/utils/style/style.dart';
import 'package:visitor/pages/stepper.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor/pages/business.dart';

class MyFaceScanPage extends StatelessWidget {
  const MyFaceScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyFaceScan(),
      ),
    );
  }
}

class MyFaceScan extends StatefulWidget {
  const MyFaceScan({super.key});

  @override
  State<MyFaceScan> createState() => _MyFaceScanState();
}

class _MyFaceScanState extends State<MyFaceScan> {
  List<String> statusText = [
    "AI กำลังเปรียบเทียบใบหน้ากรุณารอสักครู่",
    "หน้าของคุณไม่ตรงกับบัตรประชาชน กรุณาติดต่อเเผนกต้อนรับ"
  ];
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel(); // ยกเลิก Timer ที่กำลังทำงาน
    _inactivityTimer = Timer(const Duration(seconds: 60), _navigateToHomePage); // ตั้งเวลาใหม่
  }

  void _navigateToHomePage() {
    if (!mounted) return; 

  }

  @override
  void dispose() {
    _inactivityTimer?.cancel(); // ยกเลิก Timer เมื่อหน้าจอถูกทิ้ง
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
              child: MyStepper(initialStep: 3),
            ),
            Text(
              statusText[0],
              style: AppTextStyle.heading,
            ),
            const SizedBox(height: 30),
            LottieBuilder.asset(
              'animations/animationscan.json',
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('ตกลง'),
              onPressed: () {
                _inactivityTimer?.cancel(); // ยกเลิก Timer ก่อนการนำทาง
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBusiness()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
