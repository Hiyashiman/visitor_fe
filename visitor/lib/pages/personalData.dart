// ignore: file_names
import 'package:flutter/material.dart';
import 'package:visitor/pages/business.dart';
import 'package:visitor/pages/registration-system.dart';
import 'dart:async';
// import 'package:visitor/pages/register-system';

void main() => runApp(const Agreement());

class Agreement extends StatelessWidget {
  const Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PersonalDataConsentScreen(),
    );
  }
}

class PersonalDataConsentScreen extends StatefulWidget {
  const PersonalDataConsentScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PersonalDataConsentScreenState createState() =>
      _PersonalDataConsentScreenState();
}

class _PersonalDataConsentScreenState extends State<PersonalDataConsentScreen> {
  int _currentStep = 0;
  // ignore: unused_field
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel(); // ยกเลิก Timer เก่าก่อนสร้างใหม่
    _inactivityTimer = Timer(const Duration(seconds: 5), _navigateToHomePage);
  }

  void _navigateToHomePage() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // ปิด AlertDialog หรือหน้าต่างที่เปิดอยู่
    }
    // ตรวจสอบ path และ class ให้ถูกต้องสำหรับหน้าแรกของแอปพลิเคชันของคุณ
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyApp()),
        (Route<dynamic> route) => false);
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel(); // ยกเลิก Timer เมื่อ widget นี้ถูก dispose
    super.dispose();
  }

  // ignore: unused_element
  void _showDoNotConsentAlert() {
    _resetInactivityTimer();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(''),
          content: const Text('กรุณาติดต่อพนักงานแผนกต้อนรับ'),
          actions: <Widget>[
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // ปิด AlertDialog นี้ก่อนกลับหน้าแรก
                _navigateToHomePage();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data Consent'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stepper(
            steps: [
              Step(
                title: const Text('Step 1'),
                content: Container(),
                isActive: _currentStep == 0,
              ),
              // ... other steps
            ],
            currentStep: _currentStep,
            onStepTapped: (step) => setState(() => _currentStep = step),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      _resetInactivityTimer(); // รีเซ็ต Timer ทุกครั้งที่ผู้ใช้คลิก Next หรือ Back
                      details.onStepContinue!();
                    },
                    child: const Text('Next'),
                  ),
                  TextButton(
                    onPressed: () {
                      _resetInactivityTimer(); // รีเซ็ต Timer ทุกครั้งที่ผู้ใช้คลิก Next หรือ Back
                      details.onStepCancel!();
                    },
                    child: const Text('Back'),
                  ),
                ],
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ข้อตกลง การใช้บริการPersonal Data Consent',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ข้าพเจ้ายินยอมให้ไว้ซึ่งข้อมูลอันเป็นข้อมูลส่วนนุคคดของข้าพเจ้าแก่ผู้รับหน้าที่จัดเก็บข้อมูลและประมวลผลของระมนี้เพื่อใช้ประโยชน์ในงานรักษาความปลอดภัยของอาคารสถานที่แห่งนี้ โดยการจัดเก็บเป็นไปตามข้อกําหนดและผู้จัดเก็บสามารถลมท่าลายข้อมูลทั่งหมดหรือบางส่วนของข้าพเจ้าโดยไม่ต้องแจ้งให้ข้าพเจ้าทราบล่วงหน้า',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _showDoNotConsentAlert,
                      child: const Text('ไม่ยินยอม'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: const Text('ตกลง'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('back'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
