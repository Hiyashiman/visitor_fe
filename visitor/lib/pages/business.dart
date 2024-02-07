import 'package:flutter/material.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/pages/stepper.dart';
// Make sure to import your pages correctly

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hasButtonBeenPressed = false;
  int? _selectedButtonIndex;

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
      child: Center(
        child: Text(
          'กรุณาเลือกธุระที่มาติดต่อ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildButtonGrid(int crossAxisCount) {
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
      shrinkWrap: true, // Added to make GridView work in SingleChildScrollView
      physics:
          NeverScrollableScrollPhysics(), // Disable scrolling within the GridView
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        childAspectRatio: 3,
      ),
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        bool isSelected = _selectedButtonIndex == index;
        return ElevatedButton(
          onPressed: () {
            setState(() {
              _hasButtonBeenPressed = true;
              _selectedButtonIndex = index;
            });
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
          'ธุระอื่นๆนอกจากรายการข้างต้น กรุณากดปุ่ม ยกเลิก',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildFooterButton(BuildContext context) {
    return ElevatedButton(
      child: Text('ยกเลิก'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const MyApp()), // Update with the correct navigation if MyApp is not the target
        );
      },
    );
  }
}
