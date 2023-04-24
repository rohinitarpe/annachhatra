import 'package:flutter/material.dart';
import 'package:annachhatra/constants.dart';
import 'package:annachhatra/models/food_data.dart';


class Food{
  final String foodname;
  final String foodquantity;
  bool isAvailable;

  Food({required this.foodname,required this.foodquantity,this.isAvailable = false});

  void toggleAvailable(){
    isAvailable = !isAvailable;
  }
}

class Hotel{
  final String hotelimage;
  final String hotelname;
  final String hotelinfo;
  // String qunatity;
 // final onViwbtn;

  Hotel( this.hotelimage, this.hotelname,this.hotelinfo,
    //required this.qunatity,
   // required this.onViwbtn
  );
}


