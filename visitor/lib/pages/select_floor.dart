import 'package:flutter/material.dart';
import 'package:visitor/pages/personalData.dart';

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
  // ignore: library_private_types_in_public_api
  _KeypadState createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  // You can use a list to manage the keypad labels
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

  void _onKeypadTap(String label) {
    // Handle the keypad button tap
    // ignore: avoid_print
    print('Button $label tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'กรุณาเลือกน้ำหนักตัว',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, //จำนวนปุ่ม
              childAspectRatio: 4.0, // Aspect ratio for the buttons
              crossAxisSpacing: 15, // Horizontal space between buttons
              mainAxisSpacing: 20, // Vertical space between buttons
            ),
            itemCount: _keyLabels.length,
            itemBuilder: (BuildContext context, int index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Button background color
                  disabledBackgroundColor: Colors.black, // Button text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                onPressed: () => _onKeypadTap(_keyLabels[index]),
                child: Text(_keyLabels[index]),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonalData()),
              );
            },
            child: const Text('ตกลง'), // 'OK' or 'Confirm' button
          ),
        ),
      ],
    );
  }
}
