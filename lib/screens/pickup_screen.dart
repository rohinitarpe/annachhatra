import 'package:flutter/material.dart';
import 'package:annachhatra/screens/home_screen.dart';

class PickUpScreen extends StatefulWidget {
 // const PickUpScreen({Key? key}) : super(key: key);
  static const String id = 'pickup_screen';

  @override
  State<PickUpScreen> createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(81, 146, 89, 1),
        title: Text('Pick Ups'),
      ),
      body: ListView.builder(
        itemCount: 1,
          itemBuilder: (context,index){
       return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 156,
              width: 397,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 156,
                          width: 113,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(200, 92, 92, 0.6),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                    color: Color.fromRGBO(100, 100, 100, 1),
                                  ),
                                ),
                                Text('2',
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
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text('Paneer Masala',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromRGBO(81, 146, 89, 1)
                              ),
                            ),
                            SizedBox(width: 80.0,),
                            Text('2',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromRGBO(100,100,100,1)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text('Chicken Kebab',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromRGBO(200, 92, 92, 0.6)
                              ),
                            ),
                            SizedBox(width: 80.0,),
                            Text('10',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromRGBO(100,100,100,1)
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text('9:10 ,today',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                  color: Color.fromRGBO(100, 100, 100, 1)
                              ),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, HomeScreen.id);
                              },
                              child: Container(
                                height: 29.0,
                                width: 104.38,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(187, 72, 72, 1),
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
                                      child: Text('Cancel',
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
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
