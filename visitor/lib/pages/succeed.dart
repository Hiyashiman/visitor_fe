import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor/pages/registration-system.dart'; // ตรวจสอบ path ที่ถูกต้อง
import 'package:visitor/pages/stepper.dart';
import 'package:visitor/utils/style/style.dart';

class PageSucceed extends StatefulWidget {
  const PageSucceed({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PageSucceedState createState() => _PageSucceedState();
}

class _PageSucceedState extends State<PageSucceed> {
  Timer? _inactivityTimer;
 

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
  }

  void _resetInactivityTimer()async {

    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 180), _navigateToHomePage);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          child: SizedBox(
            height: 150,
            child: MyStepper(initialStep: 6),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(
            'ลงทะเบียนสำเร็จกรุณาดึงบัตรประชาชนออก',
            style: AppTextStyle.textsuccess,
          ),
        ),
        const SizedBox(height: 50),
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
    );
  }
}
