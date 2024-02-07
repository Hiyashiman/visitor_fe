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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            SizedBox(height: 32),
            _buildFooterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStepProgressIndicator() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: const Center(
        // This will center the Text widget within the Container
        child: Text(
          'กรุณาเลือกธุระที่มาติดต่อ',
          textAlign: TextAlign
              .center, // This ensures the text is centered if it wraps to a new line
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

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
      // Add all button labels
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        childAspectRatio: 3, // Adjust for your layout needs
      ),
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        bool isSelected =
            _selectedButtonIndex == index; // Check if this button is selected
        return ElevatedButton(
          onPressed: () {
            _inactivityTimer?.cancel();
            setState(() {
              _hasButtonBeenPressed = true; // Update button press state
              _selectedButtonIndex = index; // Update the selected button index
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PageSucceed()));
          },
          child: Text(buttonLabels[index]),
          style: ElevatedButton.styleFrom(
            primary: isSelected
                ? Colors.blue[800]
                : Colors.grey[300], // Darken if selected
            onPrimary:
                isSelected ? Colors.white : Colors.black, // Text color contrast
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }

  Widget _Text() {
    return Container(
      child: const Center(
        child: Text(
          'ธุระอื่นๆนอกจากรายการข้างต้น  กรุณากดปุ่ม ยกเลิก',
          textAlign: TextAlign
              .center,
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }

  // Modify onPressed to check _hasButtonBeenPressed
  Widget _buildFooterButton(BuildContext context) {
    return ElevatedButton(
      child: Text('ยกเลิก'),
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
