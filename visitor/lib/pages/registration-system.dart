import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor/pages/select_floor.dart';
import 'package:visitor/pages/succeed.dart';
import 'package:visitor/utils/style/style.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  int _tapCount = 0; // สร้างตัวแปรเพื่อนับจำนวนการกด
  String? identificationNumber = '1234567890';
  String? firstName = 'John';
  String? lastName = 'Doe';
  String? birthday = '01-01-1990';
  String? address = '123 Main Street, City, Country';
  String? cardIssueDate = '01-01-2020';
  String? cardExpirationDate = '01-01-2030';
  String? cardholderPhoto = 'assets/images/cardholder_photo.png';

  Map<String, String> createIdCardData() {
    return {
      'IdNumber': identificationNumber!,
      'FirstName': firstName!,
      'LastName': lastName!,
      'Birthday': birthday!,
      'Address': address!,
      'CardIssueDate': cardIssueDate!,
      'CardExpirationDate': cardExpirationDate!,
      'CardholderPhoto': cardholderPhoto!,
    };
  }

  void _incrementTap() {
    setState(() {
      _tapCount++;
    });
    if (_tapCount > 15) {
      // ถ้าการกดมากกว่า 10 ครั้ง
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>  PageSucceed()), // ไปยังหน้า....
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
                  Map<String, String> data = createIdCardData();
                  // ส่ง data map ไปยัง SelectFloor
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SelectFloor(data: data)),
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
