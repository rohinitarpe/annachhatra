import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:annachhatra/screens/home_screen.dart';

class FoodDetailScreen extends StatefulWidget {
  static const String id = 'fooddetail_screen';

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  FirebaseFirestore db =FirebaseFirestore.instance;
//   @override
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Column(
          children: [
          Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 165,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  image: AssetImage('images/hotel-green.png'),
                  fit: BoxFit.fill
              ),
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
            child: Text('Hotel Green Leaf',
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
        ],
      ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Food Details',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(100, 100, 100, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 140,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Quantity',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(100, 100, 100, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             SizedBox(height: 20.0,),
              FoodName(
                foodname: 'Paneer Masala',
                quantity: '2',
              ),

              FoodName(
                  foodname: 'Chicken Kebab',
                  quantity: '10',
              ),
              SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Available',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(100, 100, 100, 1),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(width: 180,),
                 Checkbox(
                     value: checkbox,
                     onChanged: (value){
                       setState(() {
                         checkbox = !checkbox;
                       });
                     },
                 ),
                ],
              ),
              SizedBox(height: 100,),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      child: Container(
                        height: 29.0,
                        width: 104.38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Cancel',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(240, 187, 98, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PopUP(
                    imagename: 'images/hotel-green.png',
                    hotelname: 'Hotel Green Leaf',
                    hotelinfo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                    requestconfirmation: 'Your Request Accepted !',
                    message: 'Please do collect the parcel from counter',
                    onPressed: (){
                      Navigator.pushNamed(context, HomeScreen.id);
                      db.collection('orders').add({
                        'order_availability' : checkbox.toString(),
                      });
                    }
                  ),
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}



class PopUP extends StatelessWidget {
  late String imagename;
  late String hotelname;
  late String hotelinfo;
  late String requestconfirmation;
  late String message;
  late final onPressed;

  PopUP({required this.imagename,required this.hotelname,required this.hotelinfo,
    required this.requestconfirmation,required this.message,required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomeScreen())
          );
          showGeneralDialog(
              context: context,
              pageBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  ){
                return AlertDialog(
                  scrollable: true,
                  title: Container(
                    height: 165,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: AssetImage(imagename),
                          fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  content: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              hotelname,
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
                          child: Text(hotelinfo,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(100, 100, 100, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 89,),
                        Center(
                          child: Text(requestconfirmation,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                            color: Color.fromRGBO(81, 146, 89, 1)
                          ),
                          ),
                        ),
                        SizedBox(height: 34.0,),
                        Align(
                          alignment: Alignment.center,
                          child: Text(message,
                            style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(81, 146, 89, 1)
                            ),
                          ),
                        ),
                        SizedBox(height: 107.0,),
                        MaterialButton(
                            onPressed: onPressed,
                            //     (){
                            //   Navigator.pushNamed(context, HomeScreen.id);
                            // },
                          child: Container(
                            height: 29.0,
                            width: 104.38,
                            decoration:BoxDecoration(
                              color: Color.fromRGBO(240, 187, 98, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )

                );
              }
          );
        },
        child: Container(
          height: 29.0,
          width: 104.38,
          decoration: BoxDecoration(
            color: Color.fromRGBO(240, 187, 98, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Pick Up',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodName extends StatelessWidget {
  late String foodname;
  late String quantity;

  FoodName({required this.foodname,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              foodname,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
            ),
          ),
        ),
        SizedBox(width: 160,),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              quantity,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
                color: Color.fromRGBO(100, 100, 100, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
