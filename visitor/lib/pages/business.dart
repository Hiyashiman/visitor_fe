import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/pages/registration-system.dart'; // Update with correct import path
import 'package:visitor/pages/stepper.dart'; // Update with correct import path
import 'package:visitor/pages/succeed.dart'; // Update with correct import path
import 'package:visitor/utils/style/style.dart'; // Update with correct import path
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late int  busineesId;

  bool _hasButtonBeenPressed = false;
  int? _selectedButtonIndex;
  Timer? _inactivityTimer;
  String? _SelectedBook = '';
  final dio = Dio();
  List<String> businessNames = [];
  List<int> busineesIds = [];

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
    _getBusiness();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 60), _navigateToHomePage);
  }

  Future<void> _getBusiness() async {
    try {
      final response = await dio.get('http://192.168.1.120:8000/api/business/all/');
      var businessData = response.data['data'];
      if (businessData is List) {
        setState(() {
          businessNames = List<String>.from(
              businessData.map((business) => business['name'].toString()));
        
          busineesIds = List<int>.from(
              businessData.map((e) => e['id'])

          );
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
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

  void mockSaveSelectedbuttonLabels(String buttonLabels, String pressedTime  ,int id)async {
    // ที่นี่คุณสามารถจำลองการบันทึกข้อมูลไปยังฐานข้อมูลหรือการเรียกใช้งาน API
    _SelectedBook = buttonLabels;
    busineesId = id ;
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('business_id',busineesId);
    var data = prefs.getInt('floor_id');
    print("floor_id:$data");
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

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        childAspectRatio: 4.5,
      ),
      itemCount: businessNames.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            var now = DateTime.now(); // บันทึกช่วงเวลาปัจจุบัน
            _inactivityTimer?.cancel();
            setState(() {

              _hasButtonBeenPressed = true;
              _selectedButtonIndex = index;
              mockSaveSelectedbuttonLabels(
                  businessNames[index], now.toString() , busineesIds[index]); // ส่งช่วงเวลาไปด้วย
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PageSucceed()));
          },
          child: Text(businessNames[index]),
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
        _inactivityTimer?.cancel(); 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
    );
  }
}
