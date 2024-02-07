import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/pages/business.dart';
import 'package:visitor/pages/face_comparison.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/pages/stepper.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              child: SizedBox(
                height: 150,
                child: MyStepper(initialStep: 2),
              ),
            ),
            const SizedBox(
                height: 16), // Add some space between the stepper and the text
            const Center(
              // Center widget added
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'ข้อตกลง การใช้บริการPersonal Data Consent',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Text alignment set to center
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ข้าพเจ้ายินยอมให้ไว้ซึ่งข้อมูลอันเป็นข้อมูลส่วนนุคคดของข้าพเจ้าแก่ผู้รับหน้าที่จัดเก็บข้อมูลและประมวลผลของระมนี้เพื่อใช้ประโยชน์ในงานรักษาความปลอดภัยของอาคารสถานที่แห่งนี้'
                  'โดยการจัดเก็บเป็นไปตามข้อกําหนดและผู้จัดเก็บสามารถลมท่าลายข้อมูลทั่งหมดหรือบางส่วนของข้าพเจ้าโดยไม่ต้องแจ้งให้ข้าพเจ้าทราบล่วงหน้า',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center, // Text alignment set to center
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () => _showDoNotConsentAlert(context),
                        child: const Text(
                          'ไม่ยินยอม',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(color: Colors.white)),
                        onPressed: () {
                          _inactivityTimer?.cancel(); // ยกเลิก Timer ก่อนนำทาง
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyFaceScanPage()),
                          ).then((_) =>
                              _resetInactivityTimer()); // รีเซ็ต Timer เมื่อกลับมา
                        },
                        child: const Text(
                          'ยินยอม',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
