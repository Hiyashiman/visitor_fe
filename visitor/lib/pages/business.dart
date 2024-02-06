import 'package:flutter/material.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/pages/stepper.dart';

void main() {
  runApp(Mybusiness());
}

class Mybusiness extends StatelessWidget {
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

class MyHomePage extends StatelessWidget {
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
            // Grid of Buttons
            Expanded(child: _buildButtonGrid()),
            SizedBox(height: 32),
            // Footer Button
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
      child: Center(
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
      'มาร่วมงาน Event',
      // Add all button labels
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        childAspectRatio: 5,
      ),
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            // Handle your button tap
          },
          child: Text(buttonLabels[index]),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[300], // Background color
            onPrimary: Colors.black, // Text Color
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
          'ธุระอื่นๆนอกจากรายการข้างต้น  กรุณากดปุ่ม ยกเลิก',
          textAlign: TextAlign
              .center, // This ensures the text is centered if it wraps to a new line
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildFooterButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, 
         MaterialPageRoute(builder: (context) => const MyApp()),
         );
      },
      child: Text('ยกเลิก'), // Your footer button text
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8), // Reduced vertical padding/ Sets a smaller minimum size for the button
        shape: RoundedRectangleBorder(
        ),
      ),
    );
  }
}
