import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visitor/pages/registration-system.dart'; // Update with correct import path
import 'package:visitor/widget/stepper.dart';
import 'package:visitor/pages/succeed.dart'; // Update with correct import path
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyBusiness());
}

// ignore: use_key_in_widget_constructors
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

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late int  busineesId;

  // ignore: unused_field
  bool _hasButtonBeenPressed = false;
  int? _selectedButtonIndex;
  Timer? _inactivityTimer;
  // ignore: non_constant_identifier_names
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
      final response = await dio.get('http://192.168.1.126:8000/api/business/all/');
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
      // ignore: avoid_print
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
    // ignore: avoid_print
    print("floor_id:$data");
    // ignore: avoid_print
    print('selected : $_SelectedBook');
    // ignore: avoid_print
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
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 200,
                child: const MyStepper(initialStep: 4),
              ),
            ),
            // Step Progress Indicator
            _buildStepProgressIndicator(),
            const SizedBox(height: 32),
            Expanded(child: _buildButtonGrid()),
            const SizedBox(height: 32),
            _Text(),
            const SizedBox(height: 40),
            _buildFooterButton(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildStepProgressIndicator() {
    return Container(
      padding: const EdgeInsets.all(300),
      decoration: BoxDecoration(
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
          // ignore: sort_child_properties_last
          
          child: Text(businessNames[index]),
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedButtonIndex == index
                ? Colors.blue[800]
                : Colors.grey[300],
            // ignore: deprecated_member_use
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
