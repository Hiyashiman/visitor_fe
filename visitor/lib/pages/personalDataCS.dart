// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:visitor/pages/business.dart';
import 'package:visitor/pages/camera.dart';
import 'package:visitor/pages/face_comparison.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/widget/stepper.dart';

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
  Timer? _inactivityTimer;
  String? _selectedPersonal = "";
  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 60), _navigateToHomePage);
  }

  // ignore: unused_element
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

  void _showDoNotConsentAlert(BuildContext context) {
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
                _selectedPersonal = "ไม่ยินยอม";
                // ignore: avoid_print
                print("User selection: $_selectedPersonal");
                _inactivityTimer?.cancel(); // ยกเลิก Timer ก่อนนำทาง
                Navigator.of(context)
                    .pushReplacement(
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    )
                    .then((_) => _resetInactivityTimer());
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
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _resetInactivityTimer, // รีเซ็ต Timer เมื่อมีการแตะหน้าจอ
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              child: SizedBox(
                height: 200,
                child: MyStepper(initialStep: 2),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(250.0),
                child: Text(
                  'ข้อตกลงการใช้บริการ  Personal Data Consent',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'ข้าพเจ้ายินยอมให้ไว้ซึ่งข้อมูลอันเป็นข้อมูลส่วนบุคคลของข้าพเจ้าแก่ผู้รับหน้าที่จัดเก็บข้อมูลและประมวลผลของระบบนี้เพื่อใช้ประโยชน์ในงานรักษาความปลอดภัยของอาคารสถานที่',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        
                        Text(
                          'แห่งนี้โดยการจัดเก็บเป็นไปตามข้อกําหนดและผู้จัดเก็บสามารถลบทำลายข้อมูลทั้งหมดหรือบางส่วนของข้าพเจ้าโดยไม่ต้องแจ้งให้ข้าพเจ้าทราบล่วงหน้า',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                     
                      ],
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 20.0),
                      ),
                      onPressed: () => _showDoNotConsentAlert(context),
                      child: const Text(
                        'ไม่ยินยอม',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90.0, vertical: 21.0),
                      ),
                      onPressed: () {
                        _inactivityTimer?.cancel(); // ยกเลิก Timer ก่อนนำทาง
                        _selectedPersonal = "ยินยอม";
                        // ignore: avoid_print
                        print("User selection: $_selectedPersonal");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Mycamer()),
                        );
                      },
                      child: const Text(
                        'ยินยอม',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
