import 'package:flutter/material.dart';
import 'package:visitor/utils/style/style.dart';
import 'package:visitor/pages/stepper.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor/pages/business.dart';
/*
ทำการขอผู็ใช้งานเข้ามาตรวจสอบ
เเล้วส่ง User กลับไป


*/
var statuserror = "หน้าของคุณไม่ตรงกับใบหน้าในบัตรประชาชน";
class MyFaceScanPage extends StatelessWidget {
  const MyFaceScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
List <String> statusText = ["AI กำลังเปรียบเทียบใบหน้ากรุณารอสักครู่","หน้าของคุณไม่ตรงกับบัตรประชาชน กรุณาติดต่อเเผนกต้อนรับ"];
int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
            child: SizedBox(
              height: 150, // Example: Enforce a height constraint
              child: MyStepper(initialStep: 3),
            ),
           )   
           ,

            Text(statusText[0],style: AppTextStyle.heading,),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyBusiness()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
