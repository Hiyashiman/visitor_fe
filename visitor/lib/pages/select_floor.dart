import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor/pages/personalDataCS.dart';
import 'package:visitor/pages/registration-system.dart';
import 'package:visitor/widget/stepper.dart';
import 'package:visitor/utils/style/style.dart';
import 'package:dio/dio.dart';
import 'dart:typed_data';

void main() => runApp(const SelectFloor(
      data: {},
    ));

class SelectFloor extends StatelessWidget {
  final Map<String, String> data;
  const SelectFloor({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
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
  // ignore: library_private_types_in_public_api
  _KeypadState createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // ignore: non_constant_identifier_names
  late int floor_id ; 
    final dio = Dio();
  Uint8List? _imageBytes;
  Timer? _inactivityTimer;
  bool _isButtonSelected = false;
  String _selectedKey = '';
  // ignore: non_constant_identifier_names
  String? _SelectedFloor = '';
  List<String> floorNames = [];
  List<int> floorId = [];

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
    _getFloor();

  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 60), _navigateToHomePage);
  }
    Future<void> _getFloor() async {
      try {
     final response = await dio.get('http://192.168.1.120:8000/api/floor/');
      var floorData = response.data['data'];
      if (floorData is List) {
        setState(() {
          floorNames = List<String>.from(
              floorData.map((floor) => floor['floor_number'].toString()));
          floorId = List<int>.from(floorData.map((e) => e['id']));
        // ignore: avoid_print
        print(floorId);
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
    _inactivityTimer?.cancel(); // ยกเลิก Timer เมื่อ widget ถูกทิ้ง
    super.dispose();
  }

  void _onFloorTap(String label , int id) async {

    final SharedPreferences prefs = await _prefs;
    floor_id = id ; 
    await prefs.setInt('floor_id', floor_id);

    // ignore: avoid_print
    print("floor id :$floor_id");
    setState(() {

      _isButtonSelected = true;
      _selectedKey = label;
      _SelectedFloor = label;
    });
    _resetInactivityTimer(); // รีเซ็ต Timer เมื่อมีการโต้ตอบ
  }

  // ที่นี่คุณสามารถจำลองการบันทึกข้อมูลไปยังฐานข้อมูลหรือการเรียกใช้งาน API
  // ignore: non_constant_identifier_names
  void Floor(String floor) {
    _SelectedFloor = floor;
    // ignore: avoid_print
    print('selected floor: $_SelectedFloor');
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          child: SizedBox(
            height: 200,
            child: MyStepper(initialStep: 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(250.0),
          child: Text(
            'กรุณาเลือกชั้นที่ต้องการทำธุระ',
            style: AppTextStyle.heading,
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
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.1,
              mainAxisSpacing: 10,
            ),
            itemCount:  floorNames.length,
            itemBuilder: (BuildContext context, int index) {
              bool isSelected = _selectedKey == floorNames[index];

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () => _onFloorTap(floorNames[index] , floorId[index]),
                child: Text(
                  floorNames[index],
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
              backgroundColor: _isButtonSelected
                  ? Colors.blue
                  : Colors.grey, 
              foregroundColor: Colors.white,
            ),
            onPressed: _isButtonSelected
                ? () {
                    _inactivityTimer?.cancel();
                    Floor(_selectedKey);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PersonalDataConsentScreen()),
                    ).then((_) => _resetInactivityTimer());
                  }
                : null,
            child: const Text('ตกลง'),
          ),
        ),
      ],
    );
  }
}

