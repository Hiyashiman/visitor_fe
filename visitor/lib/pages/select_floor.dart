import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/pages/personalDataCS.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/pages/stepper.dart';

void main() => runApp(const SelectFloor(data: {},));

class SelectFloor extends StatelessWidget {
  final Map<String, String> data;
  const SelectFloor({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     print("IDcardUesr: $data");
    return const MaterialApp(
      home: Scaffold(
        body: Keypad(),
      ),
    );
  }
}

class Keypad extends StatefulWidget {
  const Keypad({super.key});

  @override
  _KeypadState createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  // You can use a list to manage the keypad labels
  final List<String> _floor = [
    'B',
    'G',
    'M',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  bool _isButtonSelected = false;
  String _selectedKey = '';
  Timer? _inactivityTimer;
  String _SelectedFloor = '';

  @override
  void initState() {
    super.initState();
    // _startInactivityTimer();
    _resetInactivityTimer();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 60), _navigateToHomePage);
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
    _inactivityTimer?.cancel(); // ยกเลิก Timer เมื่อ widget ถูกทิ้ง
    super.dispose();
  }

  void _onFloorTap(String label) {
    setState(() {
      _isButtonSelected = true;
      _selectedKey = label;
    });
    _resetInactivityTimer(); // รีเซ็ต Timer เมื่อมีการโต้ตอบ
  }

  //_mockSelectedFloor
  void mockSaveSelectedFloor(String floor) {
  // ที่นี่คุณสามารถจำลองการบันทึกข้อมูลไปยังฐานข้อมูลหรือการเรียกใช้งาน API
  _SelectedFloor = floor;
  print('selected floor: $_SelectedFloor');
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          child: SizedBox(
            height: 150,
            child: MyStepper(initialStep: 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(80.0),
          child: Text(
            'กรุณาเลือกชั้นที่ต้องการทำธุระ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 3
                      : 5, // ปรับจำนวนปุ่มในแนวนอนตามแนวนอนหรือแนวตั้งของหน้าจอ
              childAspectRatio: 2.0,
              crossAxisSpacing: MediaQuery.of(context).size.width *
                  0.1, // ปรับระยะห่างในแนวนอนของปุ่ม
              mainAxisSpacing: 10,
            ),
            itemCount: _floor.length,
            itemBuilder: (BuildContext context, int index) {
              bool isSelected = _selectedKey == _floor[index];

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () => _onFloorTap(_floor[index]),
                child: Text(
                  _floor[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              _inactivityTimer?.cancel();
              mockSaveSelectedFloor(_selectedKey);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PersonalDataConsentScreen()),
              ).then((_) => _resetInactivityTimer());
            },
            // ใช้ _isButtonSelected เพื่อควบคุมการเปิดใช้งานของปุ่ม
            child: const Text('ตกลง'), 

          ),
        ),
      ],
    );
  }
}
