import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/pages/stepper.dart';
<<<<<<< HEAD
import 'package:visitor/pages/succeed.dart';
=======
// Make sure to import your pages correctly
>>>>>>> business

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Initialize a variable to track if any button has been pressed
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
    // Using MediaQuery to get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // Added to make the layout scrollable on small devices
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                child: Container(
                  height: 150,
                  child: MyStepper(
                      initialStep:
                          4), // Assuming this is a custom widget you've defined
                ),
              ),
              _buildStepProgressIndicator(),
              SizedBox(height: 32),
              // Adjusting the grid layout based on screen width
              Expanded(
                child: _buildButtonGrid(screenWidth > 600
                    ? 4
                    : 2), // If screen width is greater than 600px, use 4 columns; otherwise, use 2
              ),
              SizedBox(height: 32),
              _Text(),
              SizedBox(height: 4),
              _buildFooterButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepProgressIndicator() {
    // Text size can be made responsive as well, but keeping it simple for now
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
<<<<<<< HEAD
      child: const Center(
        // This will center the Text widget within the Container
=======
      child: Center(
>>>>>>> business
        child: Text(
          'กรุณาเลือกธุระที่มาติดต่อ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

<<<<<<< HEAD
  // Add all button labels
  Widget _buildButtonGrid() {
=======
  Widget _buildButtonGrid(int crossAxisCount) {
>>>>>>> business
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
<<<<<<< HEAD
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
=======
      shrinkWrap: true, // Added to make GridView work in SingleChildScrollView
      physics:
          NeverScrollableScrollPhysics(), // Disable scrolling within the GridView
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
>>>>>>> business
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        childAspectRatio: 3,
      ),
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        bool isSelected = _selectedButtonIndex == index;
        return ElevatedButton(
          onPressed: () {
            _inactivityTimer?.cancel();
            setState(() {
              _hasButtonBeenPressed = true;
              _selectedButtonIndex = index;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PageSucceed()));
          },
          child: Text(buttonLabels[index]),
          style: ElevatedButton.styleFrom(
            primary: isSelected ? Colors.blue[800] : Colors.grey[300],
            onPrimary: isSelected ? Colors.white : Colors.black,
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
      child: Center(
        child: Text(
<<<<<<< HEAD
          'ธุระอื่นๆนอกจากรายการข้างต้น  กรุณากดปุ่ม ยกเลิก',
          textAlign: TextAlign
              // This ensures the text is centered if it wraps to a new line
              .center,
=======
          'ธุระอื่นๆนอกจากรายการข้างต้น กรุณากดปุ่ม ยกเลิก',
          textAlign: TextAlign.center,
>>>>>>> business
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
<<<<<<< HEAD
        _inactivityTimer?.cancel();
        // Your footer button text
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        ).then((_) => _resetInactivityTimer());
=======
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MyApp()), // Update with the correct navigation if MyApp is not the target
        );
>>>>>>> business
      },
    );
  }
}
