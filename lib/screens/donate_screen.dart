import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:annachhatra/models/add_dish.dart';
import 'package:annachhatra/models/food_data.dart';
import 'package:annachhatra/widgets/food_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:annachhatra/constants.dart';
import 'package:provider/provider.dart';

class DonateScreen extends StatefulWidget {

  static const String id = 'donate_screen';
  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  FirebaseFirestore db =FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  bool checkbox = false;
  late String newFoodName;
  late String newFoodQuantity;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 165,
                width: 400,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240,187,98,1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('User Name',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(100, 100, 100, 1)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    color: Color.fromRGBO(100, 100, 100, 1),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    textAlign: TextAlign.left,
                    onChanged: (newText){
                      newFoodName = newText;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Enter dish name'),
                  ),
                  SizedBox(height: 10.0,),
                  TextField(
                    controller: quantityController,
                    textAlign: TextAlign.left,
                    onChanged: (newValue){
                      newFoodQuantity = newValue;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Quantity'),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              TextButton(
                onPressed: () {
                  // nameController.clear();
                  // quantityController.clear();
                  Provider.of<FoodData>(context,listen: false).addFood(newFoodName, newFoodQuantity);
                  db.collection('orders').add({
                    'dish_name' : nameController.text,
                    'quantity' : newFoodQuantity.length,
                  });
                  // CollectionReference colRef = FirebaseFirestore.instance.collection('orders');
                  // colRef.add({
                  //   'dish_name': nameController.text,
                  //   'quantity' : quantityController.text,
                  // });
                   //Navigator.pop(context);
                },
                child: Container(
                  height: 29.0,
                  width: 104.38,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Add',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(81, 146, 89, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 110),
                    child: Text(
                      'Food Details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(100, 100, 100, 1),
                      ),
                    ),
                  ),
                  Text('Quantity',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  ),
                ],
              ),
              FoodList(),
              Padding(
                padding: EdgeInsets.only(bottom: 60,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Checkbox(
                    //   value: checkbox,
                    //   onChanged: (bool?value){
                    //     setState(() {
                    //       checkbox = value!;
                    //       if(checkbox = false){
                    //         print('true' + checkbox.toString());
                    //       }else{
                    //         print('false'+checkbox.toString());
                    //       }
                    //     });
                    //   }
                    // ),
                    Checkbox(
                      value: checkbox,
                      activeColor: Colors.black54,
                      onChanged: (value){
                        setState(() {
                          checkbox = !checkbox;
                        });
                      },
                    ),
                    Text('Non Veg',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(187, 72, 72, 1)
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: (){
                      db.collection('orders').add({
                        'veg' : checkbox.toString(),
                      });
                      // CollectionReference colRef = FirebaseFirestore.instance.collection('orders');
                      // colRef.add({
                      //   'veg': checkbox.toString(),
                      //
                      // });
                      checkbox.toString();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 29.0,
                      width: 104.38,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240,187,98,1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('Donate',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}

