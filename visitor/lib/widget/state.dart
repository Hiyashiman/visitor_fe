import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class Data with ChangeNotifier{
    // ignore: non_constant_identifier_names
    late int card_id  ; 
    // ignore: non_constant_identifier_names
    late int user_id ;
    // ignore: non_constant_identifier_names
    late int business_id ;
    // ignore: non_constant_identifier_names
    late int floor_id ;
    // ignore: non_constant_identifier_names
    late int image_id ; 
    late String status ; 


    // ignore: non_constant_identifier_names
    void add_card_id(int id){
      card_id = id ;
      notifyListeners();
    }
     void add_user_id(int id){
      card_id = id ;
      notifyListeners();
    }
    void add_business_id(int id){
      business_id = id;
      notifyListeners();
    }
    void add_floor_id(int id){
      floor_id = id;
      notifyListeners();
    }
    void update_status(bool status){
      status = status;
      notifyListeners();
    }
    
  void resetData() {
  card_id = Null as int; 
  user_id = Null as int;
  business_id = Null as int;
  floor_id = Null as int;
  image_id = Null as int;
  status = Null as String; // ตั้งค่าเริ่มต้นเป็นสตริงว่างหรือค่าที่เหมาะสมอื่นๆ
  notifyListeners();
}

}