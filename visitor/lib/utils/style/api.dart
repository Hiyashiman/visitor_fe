import 'dart:convert';

import 'package:http/http.dart' as http;

class Axios{
  static final _headers ={
    'Content-type': 'application/json'
  };

  static Future get(url)async{
    final resq = await http.get(Uri.parse(url), headers: _headers);
    return resq.body;
  }

  static Future post(url, body)async{
    final resq = await http.post(Uri.parse(url), headers: _headers, body: jsonEncode(body));
    return resq.body;
  }

}

