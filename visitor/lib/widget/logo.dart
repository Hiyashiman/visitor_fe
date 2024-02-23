import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';


class MyLogo extends StatefulWidget {
  const MyLogo({super.key});

  @override
  State<MyLogo> createState() => _MyLogoState();
}

class _MyLogoState extends State<MyLogo> {
   final dio = Dio();
  Uint8List? _imageBytes;

 @override
  void initState() {
    super.initState();
    _getLogo();
  }
  
   Future<void> _getLogo() async {
     try {
    final response = await dio.get('http://192.168.1.120:8000/api/logo/');
    final base64String = response.data['data']['file']; 
    // print(response.data['data']['file']);
    setState(() {
       _imageBytes = base64.decode(base64String);
    });
  } catch (e) {
    // ignore: avoid_print
    print("Error fetching image: $e");
  }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = _imageBytes != null
      ? Image.memory(_imageBytes!, fit: BoxFit.cover)
      : const Text('Loading image...');
      
   return imageWidget; // Return รูปภาพโดยตรง
  }
}
