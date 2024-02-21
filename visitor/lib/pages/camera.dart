import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visitor/pages/stepper.dart';

void main() {
  runApp(const MaterialApp(
    home: Mycamer(),
  ));
}

class Mycamer extends StatefulWidget {
  const Mycamer({Key? key}) : super(key: key);

  @override
  State<Mycamer> createState() => _HomeState();
}

class _HomeState extends State<Mycamer> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 150, // Example: Enforce a height constraint
                child: const MyStepper(initialStep: 1),
              ),
            ),
            if (imageFile != null)
              Container(
                width: 550,
                height: 400,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: FileImage(imageFile!), fit: BoxFit.cover),
                  border: Border.all(width: 8, color: Colors.black),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            else
              Container(
                width: 550,
                height: 400,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(width: 8, color: Colors.black12),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  'Image should appear here',
                  style: TextStyle(fontSize: 26),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => getImage(source: ImageSource.camera),
                      child: const Text('Capture Image',
                          style: TextStyle(fontSize: 18))),
                ),
                const SizedBox(
                  width: 20,
                ),
             
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
        source: source,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 70 //0 - 100
        );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
