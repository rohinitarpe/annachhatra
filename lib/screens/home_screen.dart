import 'package:annachhatra/screens/donate_screen.dart';
import 'package:flutter/material.dart';
import 'package:annachhatra/screens/side_screen.dart';
import 'package:annachhatra/screens/fooddetail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(81, 146, 89, 1),
        title: Text('Anna Chatra'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                Container(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, DonateScreen.id);
                    },
                    child: Text('Donate',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.asset('images/Vector.png',),
                )
              ],
            ),
          ),
        ],
      ),
        drawer: SideScreen(),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                RestaruntCard(
                  quantity: '2',
                  hotelname: 'Hotel Green Leaf',
                  hotelinfo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                  imagename: 'images/hotel-green.png',
                  onPressed:
                      (){
                    Navigator.pushNamed(context, FoodDetailScreen.id);
                  }
                ),
                RestaruntCard(
                  quantity: '10',
                  hotelname: 'Hotel Marina',
                  hotelinfo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                  imagename: 'images/hotel-marina.jpg',
                  onPressed:
                      (){
                    Navigator.pushNamed(context, FoodDetailScreen.id);
                  },

                ),
                RestaruntCard(
                  quantity: '2',
                  hotelname: 'Hotel The Park',
                  hotelinfo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                  imagename: 'images/hotel-park.jpg',
                  onPressed: (){
                    Navigator.pushNamed(context, FoodDetailScreen.id);
                  },
                ),
              ],
            ),
          ],
    ),
    );
  }
}

class RestaruntCard extends StatelessWidget {
  late String quantity;
  late String hotelname;
  late String hotelinfo;
  late String imagename;
  final onPressed;


  RestaruntCard({required this.quantity,required this.hotelname,required this.hotelinfo,
    required this.imagename,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: MaterialButton(
        onPressed: () {  },
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
                        image: AssetImage(imagename),
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
                        Text(quantity,
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
                            Text(hotelname,
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
                                child: Text(hotelinfo,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(100, 100, 100, 1)
                                  ),
                                ),
                              ),
                            ),
                      Expanded(
                        child: Align(
                         alignment: Alignment.bottomRight,
                         child: MaterialButton(
                       onPressed: onPressed,
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
                        ),
                       ),
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
    );
  }
}

