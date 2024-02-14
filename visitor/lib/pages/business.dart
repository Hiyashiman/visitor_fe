import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/pages/registration-system.dart'; // Update with correct import path
import 'package:visitor/pages/stepper.dart'; // Update with correct import path
import 'package:visitor/pages/succeed.dart'; // Update with correct import path
import 'package:visitor/utils/style/style.dart'; // Update with correct import path

void main() {
  runApp(MyBusiness());
}

class MyBusiness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hasButtonBeenPressed = false;
  int? _selectedButtonIndex;
  Timer? _inactivityTimer;
  String _SelectedBook = '';

  @override
  void initState() {
    super.initState();
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
    _inactivityTimer?.cancel();
    super.dispose();
  }

  void mockSaveSelectedbuttonLabels(String buttonLabels, String pressedTime) {
    // ที่นี่คุณสามารถจำลองการบันทึกข้อมูลไปยังฐานข้อมูลหรือการเรียกใช้งาน API
    _SelectedBook = buttonLabels;
    print('selected : $_SelectedBook');
    print('Time: $pressedTime ');
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Container(
                height: 150, // Example: Enforce a height constraint
                child: MyStepper(initialStep: 4),
              ),
            ),
            // Step Progress Indicator
            _buildStepProgressIndicator(),
            SizedBox(height: 32),
            Expanded(child: _buildButtonGrid()),
            SizedBox(height: 32),
            _Text(),
            SizedBox(height: 40),
            _buildFooterButton(context),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildStepProgressIndicator() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(3),
      ),
      child: const Center(
        // This will center the Text widget within the Container
        child: Text(
          'กรุณาเลือกธุระที่มาติดต่อ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

// Add all button labels
  Widget _buildButtonGrid() {
    List<String> buttonLabels = [
      'ส่งเอกสาร',
      'สัมภาษณ์งาน',
      'พบพนักงาน',
      'ประชุม',
      'อบรม',
      'ทำโปรเจค',
      'ผู้รับเหมา',
      'มาร่วมงาน Event'
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        childAspectRatio: 3,
      ),
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            var now = DateTime.now(); // บันทึกช่วงเวลาปัจจุบัน
            print("Button '${buttonLabels[index]}' was pressed at $now");
            _inactivityTimer?.cancel();
            setState(() {
              _hasButtonBeenPressed = true;
              _selectedButtonIndex = index;
              mockSaveSelectedbuttonLabels(
                  buttonLabels[index], now.toString()); // ส่งช่วงเวลาไปด้วย
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PageSucceed()));
          },
          child: Text(buttonLabels[index]),
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedButtonIndex == index
                ? Colors.blue[800]
                : Colors.grey[300],
            onPrimary:
                _selectedButtonIndex == index ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Text() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: const Center(
        child: Text(
          'ธุระอื่นๆนอกจากรายการข้างต้น  กรุณากดปุ่ม ยกเลิก',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }

  // Modify onPressed to check _hasButtonBeenPressed
  Widget _buildFooterButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('ยกเลิก'),
      onPressed: () {
        _inactivityTimer?.cancel(); // ยกเลิก Timer ก่อนการนำทาง
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
    );
  }
}
