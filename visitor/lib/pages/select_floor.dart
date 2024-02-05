import 'package:flutter/material.dart';
import 'package:visitor/pages/agreement.dart';

class SelectFloor extends StatelessWidget {
  const SelectFloor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Stepper Demo'),
        ),
        body: const MyCustomWidget(),
      ),
    );
  }
}

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: _currentStep < 5
                ? () => setState(() => _currentStep += 1)
                : null,
            onStepCancel: _currentStep > 0
                ? () => setState(() => _currentStep -= 1)
                : null,
            steps: List.generate(
                6,
                (index) => Step(
                      title: Text('Step ${index + 1}'),
                      content: const SizedBox(
                          height: 10.0), // Placeholder for content
                    )),
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(12, (index) {
              // Assuming the buttons are labeled from 'B' to '12'
              String label = index < 3
                  ? String.fromCharCode('B'.codeUnitAt(0) + index)
                  : (index - 2).toString();
              return ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text(label),
              );
            }),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
            ),
            child: const Text('ตกลง'), // Replace with your text

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Agreement()),
              );
            }),
      ],
    );
  }
}
