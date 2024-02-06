// import 'package:flutter/material.dart';
// import 'package:visitor/pages/registration-system.dart';
// import 'package:visitor/pages/business.dart';
// import 'dart:async';


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Personal Data Consent'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stepper(
//             steps: [
//               Step(
//                 title: const Text('Step 1'),
//                 content: Container(),
//                 isActive: _currentStep == 0,
//               ),
//               // ... other steps
//             ],
//             currentStep: _currentStep,
//             onStepTapped: (step) => setState(() => _currentStep = step),
//             controlsBuilder: (BuildContext context, ControlsDetails details) {
//               return Row(
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       _resetInactivityTimer(); // รีเซ็ต Timer ทุกครั้งที่ผู้ใช้คลิก Next หรือ Back
//                       details.onStepContinue!();
//                     },
//                     child: const Text('Next'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       _resetInactivityTimer(); // รีเซ็ต Timer ทุกครั้งที่ผู้ใช้คลิก Next หรือ Back
//                       details.onStepCancel!();
//                     },
//                     child: const Text('Back'),
//                   ),
//                 ],
//               );
//             },
//           ),
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'ข้อตกลง การใช้บริการPersonal Data Consent',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'ข้าพเจ้ายินยอมให้ไว้ซึ่งข้อมูลอันเป็นข้อมูลส่วนนุคคดของข้าพเจ้าแก่ผู้รับหน้าที่จัดเก็บข้อมูลและประมวลผลของระมนี้เพื่อใช้ประโยชน์ในงานรักษาความปลอดภัยของอาคารสถานที่แห่งนี้ โดยการจัดเก็บเป็นไปตามข้อกําหนดและผู้จัดเก็บสามารถลมท่าลายข้อมูลทั่งหมดหรือบางส่วนของข้าพเจ้าโดยไม่ต้องแจ้งให้ข้าพเจ้าทราบล่วงหน้า',
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         foregroundColor: Colors.white,
//                       ),
//                       onPressed: _showDoNotConsentAlert,
//                       child: const Text('ไม่ยินยอม'),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => MyHomePage()),
//                         );
//                       },
//                       child: const Text('ตกลง'),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blueGrey,
//                           foregroundColor: Colors.white,
//                           textStyle: const TextStyle(color: Colors.white)),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const MyApp()),
//                         );
//                       },
//                       child: const Text('back'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
