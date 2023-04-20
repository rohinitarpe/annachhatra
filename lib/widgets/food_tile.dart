import 'package:flutter/material.dart';
import 'package:annachhatra/models/add_dish.dart';
import 'package:annachhatra/screens/fooddetail_screen.dart';

class FoodTile extends StatelessWidget {

  //final bool isAvailable;
  final String foodTile;
  final String quantityTile;
  dynamic deletePressback;
 // dynamic checkboxCallback;

  FoodTile({
    //required this.isAvailable,
    required this.foodTile,
    required this.quantityTile,
  required this.deletePressback,
    //required this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
        Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: deletePressback,
                        icon: Image.asset('images/delete_icon.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Text(
                        foodTile,
                      ),
                    ),
                    SizedBox(width: 50,),
                    Text(
                        quantityTile
                    ),
                  ],
                ),
                // Checkbox(
                //     value: isAvailable,
                //     onChanged: checkboxCallback,
                // ),
              ],
            ),
          ],
        ),
      
      // trailing: Checkbox(
      //     value: isAvailable,
      //     onChanged: checkboxCallback),
    );
  }
}

class HotelTile extends StatelessWidget {
  String hotelimageTile;
  String qunatityTile;
  String namehotelTile;
  String infohotelTile;
  final onPressedTile;

  HotelTile({required this.hotelimageTile,required this.qunatityTile,required this.namehotelTile,
    required this.infohotelTile,required this.onPressedTile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Column(
            children: [
          Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Container(
            height: 282,
            width: 396.87,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 176.0,
                    width: 360,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage(hotelimageTile),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 106.0,
                      width: 112.65,
                      decoration:BoxDecoration(
                        color: Color.fromRGBO(178, 234, 112, 0.6),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20)
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0,),
                          Text('Quantity',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(100, 100, 100, 1),
                            ),
                          ),
                          Text(qunatityTile,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 36,
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(100, 100, 100, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 106.0,
                          width: 248.0,
                          decoration:BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20)
                              )
                          ),
                          child: Column(
                            children: [
                              Text(namehotelTile,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(100, 100, 100, 1)
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(infohotelTile,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Montserrat',
                                        color: Color.fromRGBO(100, 100, 100, 1),
                                    ),
                                  ),
                                ),
                              ),
                             Expanded(
                               child: TextButton(
                                   onPressed: (){
                                     Navigator.pushNamed(context, FoodDetailScreen.id);
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
                                           padding: EdgeInsets.all(2.0),
                                           child: Text('View',
                                             style: TextStyle(
                                               fontSize: 14,
                                               fontWeight: FontWeight.w700,
                                               color: Color.fromRGBO(255, 255, 255, 1),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   )
                               ),
                             ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
    ),
            ],
          ),
        ],
      ),
    );
  }
}
