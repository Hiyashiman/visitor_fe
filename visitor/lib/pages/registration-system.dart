import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor/pages/select_floor.dart';
import 'package:visitor/pages/succeed.dart';
import 'package:visitor/utils/style/style.dart';
import 'dart:convert';
import 'dart:typed_data';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  int _tapCount = 0; // สร้างตัวแปรเพื่อนับจำนวนการกด
  //mock data
  String? identificationNumber = '1234567890';
  String? firstName = 'John';
  String? lastName = 'Doe';
  String? birthday = '01-01-1990';
  String? address = '123 Main Street, City, Country';
  String? cardIssueDate = '01-01-2020';
  String? cardExpirationDate = '01-01-2030';
  String? cardholderPhoto = 'assets/images/cardholder_photo.png';

  //mapค่าในdata
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
      // ถ้าการกดมากกว่า 15 ครั้ง
      // ไปยังหน้า....
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageSucceed()),
      );
      _tapCount = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    String base64String =
        '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'; 
        // Your base64 string
    Uint8List bytes = base64.decode(base64String);

    Widget image = Image.memory(bytes, fit: BoxFit.contain);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0, // ยึดจากด้านบนของ Stack
            left: 0, // ยึดจากด้านซ้ายของ Stack
            child: Padding(
              padding: const EdgeInsets.all(8.0), // ระยะห่างจากขอบ
              child: SizedBox(
                height: 200, // ความสูงของรูปภาพ
                width: 200, // ความกว้างของรูปภาพ
                child: Image.memory(bytes, fit: BoxFit.contain),
              ),
            ),
          ),

          // ใช้ GestureDetector เพื่อจับการกด
          GestureDetector(
            // เพิ่มการนับทุกครั้งที่มีการกด
            onTap: _incrementTap,
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
                      // ส่ง data map ไปยัง SelectFloor
                      Map<String, String> data = createIdCardData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectFloor(data: data)),
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
