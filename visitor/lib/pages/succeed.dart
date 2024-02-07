import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor/pages/registration-system.dart'; // ตรวจสอบ path ที่ถูกต้อง
import 'package:visitor/pages/stepper.dart';
import 'package:visitor/utils/style/style.dart';

class PageSucceed extends StatefulWidget {
  const PageSucceed({Key? key}) : super(key: key);

  @override
  _PageSucceedState createState() => _PageSucceedState();
}

class _PageSucceedState extends State<PageSucceed> {
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 10), _navigateToHomePage);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Container(
                height: 150,
                child: const MyStepper(initialStep: 6),
              ),
            ),
            Text("ลงทะเบียนสำเร็จกรุณาดึงบัตรประชาชนออก",
                style: AppTextStyle.textsuccess),
            const SizedBox(height: 30),
            LottieBuilder.asset(
              'assets/animations/animation.json',
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 30),
            Text('สแกนหน้าหน้าเข้าอาคารได้เลย', style: AppTextStyle.getbody),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('เริ่มรายการใหม่'),
              onPressed: () {
                _inactivityTimer?.cancel();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyApp()), // อัพเดตตามหน้าเริ่มต้นของคุณ
                ).then((_) => _resetInactivityTimer());
              },
            ),
          ],
        ),
      ),
    );
  }
}
