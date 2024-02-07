import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
<<<<<<< HEAD
import 'package:visitor/pages/select_floor.dart';
import 'package:visitor/utils/style/style.dart';
=======
// import 'package:visitor/pages/personalData.dart';
import 'package:visitor/pages/select_floor.dart'; // ตรวจสอบให้แน่ใจว่าไฟล์นี้มีการนิยาม SecondRoute หรือเปลี่ยนไปใช้
import 'package:visitor/pages/stepper.dart';
>>>>>>> business

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  int _tapCount = 0; // สร้างตัวแปรเพื่อนับจำนวนการกด

  void _incrementTap() {
    setState(() {
      _tapCount++;
    });
    if (_tapCount > 15) {
      // ถ้าการกดมากกว่า 10 ครั้ง
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SelectFloor()), // ไปยังหน้า....
      );
      _tapCount = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // ใช้ GestureDetector เพื่อจับการกด
        onTap: _incrementTap, // เพิ่มการนับทุกครั้งที่มีการกด
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ระบบลงทะเบียนเข้าอาคารด้วยตนเอง",
                  style: AppTextStyle.heading),
              const SizedBox(height: 30),
              LottieBuilder.asset(
                'assets/animations/animation.json',
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 30),
              Text('กรุณาเสียบบัตรประชาชน', style: AppTextStyle.getbody),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text('เริ่มรายการ'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectFloor()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
