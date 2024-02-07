import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/pages/personalDataCS.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/pages/stepper.dart';

void main() => runApp(const SelectFloor());

class SelectFloor extends StatelessWidget {
  const SelectFloor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  final List<String> _keyLabels = [
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

  @override
  void initState() {
    super.initState();
    // _startInactivityTimer();
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
    _inactivityTimer?.cancel(); // ยกเลิก Timer เมื่อ widget ถูกทิ้ง
    super.dispose();
  }

  void _onKeypadTap(String label) {
    setState(() {
      _isButtonSelected = true;
      _selectedKey = label;
    });
    _resetInactivityTimer(); // รีเซ็ต Timer เมื่อมีการโต้ตอบ
    print('Button $label tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          child: Container(
            height: 150, // Example: Enforce a height constraint
            child: MyStepper(initialStep: 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'กรุณาเลือกชั้นที่ต้องการทำธุระ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(60.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 2.0,
              crossAxisSpacing: 100,
              mainAxisSpacing: 10,
            ),
            itemCount: _keyLabels.length,
            itemBuilder: (BuildContext context, int index) {
              bool isSelected = _selectedKey == _keyLabels[index]; //
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () => _onKeypadTap(_keyLabels[index]),
                child: Text(
                  _keyLabels[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              _inactivityTimer?.cancel();
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
