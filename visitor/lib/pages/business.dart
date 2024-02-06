import 'package:flutter/material.dart';

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

// Convert MyHomePage to a StatefulWidget to manage the button press state
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initialize a variable to track if any button has been pressed
  bool _hasButtonBeenPressed = false;
  int? _selectedButtonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'), // Corrected title
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
    // Your existing Button Grid widget
    // Add setState call inside onPressed to update _hasButtonBeenPressed
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            setState(() {
              _hasButtonBeenPressed = true; // Update button press state
              _selectedButtonIndex = index; // Update the selected button index
            });
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
              .center, // This ensures the text is centered if it wraps to a new line
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildFooterButton(BuildContext context) {
    // Modify onPressed to check _hasButtonBeenPressed
    return ElevatedButton(
      onPressed: _hasButtonBeenPressed
          ? () {
              // Perform your navigation or action here
              Navigator.pop(context); // Example action
            }
          : null, // Disable button if no button has been pressed
      child: Text('ยกเลิก'), // Corrected text
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        onPrimary: Colors.white, // Changed for better visibility
        padding: EdgeInsets.symmetric(vertical: 8),
        minimumSize: Size(30, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
