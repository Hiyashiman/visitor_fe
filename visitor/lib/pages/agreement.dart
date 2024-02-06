import 'package:flutter/material.dart';
import 'package:visitor/pages/business.dart';
import 'package:visitor/pages/face_comparison.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/pages/select_floor.dart';
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
  int _currentStep = 0;

  // ignore: unused_element
  void _showDoNotConsentAlert() {
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
                Navigator.push (
                context,
                MaterialPageRoute (builder: (context) => const SelectFloor()),// Dismiss the dialog
                );
                
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
        child: Container(
        height: 150, // Example: Enforce a height constraint
        child: MyStepper(initialStep: 2),
      ),
     )  ,
           Padding(
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
                          textStyle: const TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyFaceScanPage()),
                        );
                      },
                      child: const Text('ตกลง'),
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
