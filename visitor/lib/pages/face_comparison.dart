import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/pages/registration-system.dart';
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
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 60), _navigateToHomePage);
  }

  void _navigateToHomePage() {
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MyApp()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(2.0),
            // ปรับ padding สำหรับ MyStepper
            child: SizedBox(
              height: 180,
              width: double.infinity, // ให้ MyStepper มีความกว้างเต็มพื้นที่
              child: MyStepper(initialStep: 3),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: Text(
                      "AI กำลังเปรียบเทียบใบหน้ากรุณารอสักครู่",
                      style: AppTextStyle.heading,
                    ),
                  ),
                  const SizedBox(height: 30),
                  LottieBuilder.asset(
                    'animations/animationscan.json',
                    height: 250,
                    width: 250,
                  ),
                  const SizedBox(height: 40),
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
          ),
        ],
      ),
    );
  }
}
