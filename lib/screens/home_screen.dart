import 'package:annachhatra/screens/donate_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:annachhatra/screens/side_screen.dart';
import 'package:annachhatra/screens/registrations_screen.dart';

import '../models/add_dish.dart';

class HomeScreen extends StatefulWidget {
 // AuthService authService = AuthService();

  static const String id = 'home_screen';

  static List image = [
    'images/hotel-green.png',
    'images/hotel-marina.jpg',
    'images/hotel-park.jpg',
    ''
  ];
  static List hotelname = [
    'Hotel Green Leaf',
    'Hotel marina',
    'Hotel The Park',
    'Hotel The Pacific'
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Hotel> hoteldata = List.generate(
      HomeScreen.hotelname.length,
      (index) => Hotel(
          '${HomeScreen.image[index]}',
          '${HomeScreen.hotelname[index]}',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod'));
  bool checkbox = false;

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
                      onPressed: () {
                        Navigator.pushNamed(context, DonateScreen.id);
                      },
                      child: Text(
                        'Donate',
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
                    child: Image.asset(
                      'images/Vector.png',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        drawer: SideScreen(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData) {
              //?Center(child: CircularProgressIndicator(),):
            return  ListView.builder(
                //shrinkWrap: true,
                //   itemCount: snapshot.data?.docs.length,
                  itemCount: hoteldata.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    //var data = snapshot.data!.docs[index];
                    return MaterialButton(
                      onPressed: () {},
                      child: Column(
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
                                  child: Column(
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
                                                image: AssetImage(
                                                    hoteldata[index].hotelimage
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              )),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 106.0,
                                            width: 112.65,
                                            decoration: BoxDecoration(
                                              color:
                                              Color.fromRGBO(
                                                  178, 234, 112, 0.6),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      20)),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  'Quantity',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Montserrat',
                                                    color: Color.fromRGBO(
                                                        100, 100, 100, 1),
                                                  ),
                                                ),
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 36,
                                                    fontFamily: 'Montserrat',
                                                    color: Color.fromRGBO(
                                                        100, 100, 100, 1),
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
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius
                                                        .only(
                                                        bottomRight:
                                                        Radius.circular(20))),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      hoteldata[index]
                                                          .hotelname,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'Montserrat',
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          color: Color.fromRGBO(
                                                              100, 100, 100,
                                                              1)),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10.0),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .topLeft,
                                                        child: Text(
                                                          hoteldata[index]
                                                              .hotelinfo,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            fontFamily: 'Montserrat',
                                                            color: Color
                                                                .fromRGBO(
                                                                100, 100, 100,
                                                                1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextButton(
                                                          onPressed: () {
                                                            showGeneralDialog(
                                                                context: context,
                                                                pageBuilder: (
                                                                    BuildContext context,
                                                                    Animation<
                                                                        double>animation,
                                                                    Animation<
                                                                        double>secondaryAnimation,) {
                                                                  return MaterialApp(
                                                                    home: SafeArea(
                                                                      child: Scaffold(
                                                                        body: Column(
                                                                          mainAxisAlignment: MainAxisAlignment
                                                                              .start,
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsets
                                                                                      .all(
                                                                                      8.0),
                                                                                  child: Container(
                                                                                    height: 165,
                                                                                    width: 400,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors
                                                                                          .grey,
                                                                                      image: DecorationImage(
                                                                                          image: AssetImage(
                                                                                              hoteldata[index]
                                                                                                  .hotelimage),
                                                                                          fit: BoxFit
                                                                                              .fill),
                                                                                      borderRadius: BorderRadius
                                                                                          .only(
                                                                                        topLeft: Radius
                                                                                            .circular(
                                                                                            20),
                                                                                        topRight: Radius
                                                                                            .circular(
                                                                                            20),
                                                                                      ),
                                                                                    ),
                                                                                  ),),
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .all(
                                                                                        8.0),
                                                                                    child: Text(
                                                                                      hoteldata[index]
                                                                                          .hotelname,
                                                                                      style: TextStyle(
                                                                                          fontSize: 18,
                                                                                          fontWeight: FontWeight
                                                                                              .w700,
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Color
                                                                                              .fromRGBO(
                                                                                              100,
                                                                                              100,
                                                                                              100,
                                                                                              1)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets
                                                                                      .all(
                                                                                      8.0),
                                                                                  child: Text(
                                                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                                                                                    style: TextStyle(
                                                                                      fontSize: 12,
                                                                                      fontWeight: FontWeight
                                                                                          .w400,
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Color
                                                                                          .fromRGBO(
                                                                                          100,
                                                                                          100,
                                                                                          100,
                                                                                          1),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10.0,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment
                                                                                  .start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .all(
                                                                                        8.0),
                                                                                    child: Text(
                                                                                      'Food Details',
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            100,
                                                                                            100,
                                                                                            100,
                                                                                            1),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 140,
                                                                                ),
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .all(
                                                                                        8.0),
                                                                                    child: Text(
                                                                                      'Quantity',
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            100,
                                                                                            100,
                                                                                            100,
                                                                                            1),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20.0,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment
                                                                                  .spaceBetween,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .all(
                                                                                        8.0),
                                                                                    child: Text(
                                                                                      'Paneer Masala',
                                                                                      style: TextStyle(
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            100,
                                                                                            100,
                                                                                            100,
                                                                                            1),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 160,
                                                                                ),
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child:
                                                                                  Padding(
                                                                                    padding: EdgeInsets
                                                                                        .only(
                                                                                        right: 100),
                                                                                    child: Text(
                                                                                      '2',
                                                                                      style: TextStyle(
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            100,
                                                                                            100,
                                                                                            100,
                                                                                            1),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment
                                                                                  .spaceBetween,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .all(
                                                                                        8.0),
                                                                                    child: Text(
                                                                                      'Chicken Hebab',
                                                                                      style: TextStyle(
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            100,
                                                                                            100,
                                                                                            100,
                                                                                            1),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 160,
                                                                                ),
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets
                                                                                        .only(
                                                                                        right: 100),
                                                                                    child: Text(
                                                                                      '10',
                                                                                      style: TextStyle(
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            100,
                                                                                            100,
                                                                                            100,
                                                                                            1),),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 40.0,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment
                                                                                  .start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: Alignment
                                                                                      .topLeft,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets
                                                                                        .all(
                                                                                        8.0),
                                                                                    child: Text(
                                                                                      'Available',
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            100,
                                                                                            100,
                                                                                            100,
                                                                                            1),
                                                                                      ),
                                                                                    ),
                                                                                  ),),
                                                                                SizedBox(
                                                                                  width: 180,
                                                                                ),
                                                                                Checkbox(
                                                                                  value: checkbox,
                                                                                  activeColor: Colors
                                                                                      .black54,
                                                                                  onChanged:
                                                                                      (
                                                                                      value) {
                                                                                    setState(() {
                                                                                      checkbox =
                                                                                      !checkbox;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 100,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  child: MaterialButton(
                                                                                    onPressed: () {
                                                                                      Navigator
                                                                                          .pushNamed(
                                                                                          context,
                                                                                          HomeScreen
                                                                                              .id);
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 29.0,
                                                                                      width: 104.38,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors
                                                                                            .white,
                                                                                        borderRadius: BorderRadius
                                                                                            .circular(
                                                                                            20),
                                                                                      ),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Padding(
                                                                                              padding: EdgeInsets
                                                                                                  .all(
                                                                                                  5.0),
                                                                                              child: Text(
                                                                                                'Cancel',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight
                                                                                                      .w700,
                                                                                                  color: Color
                                                                                                      .fromRGBO(
                                                                                                      240,
                                                                                                      187,
                                                                                                      98,
                                                                                                      1),),
                                                                                              )
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: MaterialButton(
                                                                                    onPressed: () {
                                                                                      Navigator
                                                                                          .push(
                                                                                          context,
                                                                                          MaterialPageRoute(
                                                                                              builder: (
                                                                                                  context) =>
                                                                                                  HomeScreen()));
                                                                                      showGeneralDialog(
                                                                                          context: context,
                                                                                          pageBuilder: (
                                                                                              BuildContext context,
                                                                                              Animation<
                                                                                                  double> animation,
                                                                                              Animation<
                                                                                                  double> secondaryAnimation,) {
                                                                                            return AlertDialog(
                                                                                                scrollable: true,
                                                                                                title: Container(
                                                                                                  height: 165,
                                                                                                  width: 400,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Colors
                                                                                                        .grey,
                                                                                                    image: DecorationImage(
                                                                                                        image: AssetImage(
                                                                                                            hoteldata[index]
                                                                                                                .hotelimage),
                                                                                                        fit: BoxFit
                                                                                                            .fill),
                                                                                                    borderRadius: BorderRadius
                                                                                                        .only(
                                                                                                      topLeft: Radius
                                                                                                          .circular(
                                                                                                          20),
                                                                                                      topRight: Radius
                                                                                                          .circular(
                                                                                                          20),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                content: Padding(
                                                                                                  padding: EdgeInsets
                                                                                                      .all(
                                                                                                      0.0),
                                                                                                  child: Column(
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: Alignment
                                                                                                            .topLeft,
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsets
                                                                                                              .all(
                                                                                                              8.0),
                                                                                                          child: Text(
                                                                                                            hoteldata[index]
                                                                                                                .hotelname,
                                                                                                            style: TextStyle(
                                                                                                                fontSize: 18,
                                                                                                                fontWeight: FontWeight
                                                                                                                    .w700,
                                                                                                                fontFamily: 'Montserrat',
                                                                                                                color: Color
                                                                                                                    .fromRGBO(
                                                                                                                    100,
                                                                                                                    100,
                                                                                                                    100,
                                                                                                                    1)),),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets
                                                                                                            .all(
                                                                                                            8.0),
                                                                                                        child: Text(
                                                                                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
                                                                                                            style: TextStyle(
                                                                                                              fontSize: 12,
                                                                                                              fontWeight: FontWeight
                                                                                                                  .w400,
                                                                                                              fontFamily: 'Montserrat',
                                                                                                              color: Color
                                                                                                                  .fromRGBO(
                                                                                                                  100,
                                                                                                                  100,
                                                                                                                  100,
                                                                                                                  1),
                                                                                                            )
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: 89,
                                                                                                      ),
                                                                                                      Center(
                                                                                                        child: Text(
                                                                                                          'Your Request Accepted !',
                                                                                                          style: TextStyle(
                                                                                                              fontSize: 18,
                                                                                                              fontWeight: FontWeight
                                                                                                                  .w700,
                                                                                                              fontFamily: 'Montserrat',
                                                                                                              color: Color
                                                                                                                  .fromRGBO(
                                                                                                                  81,
                                                                                                                  146,
                                                                                                                  89,
                                                                                                                  1)),
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: 34.0,
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: Alignment
                                                                                                            .center,
                                                                                                        child: Text(
                                                                                                          'Please do collect the parcel from counter',
                                                                                                          style: TextStyle(
                                                                                                              fontSize: 18,
                                                                                                              //fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FontStyle
                                                                                                                  .normal,
                                                                                                              fontFamily: 'Montserrat',
                                                                                                              color: Color
                                                                                                                  .fromRGBO(
                                                                                                                  81,
                                                                                                                  146,
                                                                                                                  89,
                                                                                                                  1)),
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: 107.0,
                                                                                                      ),
                                                                                                      MaterialButton(
                                                                                                        onPressed: () {
                                                                                                          Navigator
                                                                                                              .pushNamed(
                                                                                                              context,
                                                                                                              HomeScreen
                                                                                                                  .id);
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          height: 29.0,
                                                                                                          width: 104.38,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color
                                                                                                                .fromRGBO(
                                                                                                                240,
                                                                                                                187,
                                                                                                                98,
                                                                                                                1),
                                                                                                            borderRadius: BorderRadius
                                                                                                                .circular(
                                                                                                                20),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsets
                                                                                                                .all(
                                                                                                                5.0),
                                                                                                            child: Center(
                                                                                                              child: Text(
                                                                                                                'Done',
                                                                                                                style: TextStyle(
                                                                                                                  fontSize: 14,
                                                                                                                  fontWeight: FontWeight
                                                                                                                      .w700,
                                                                                                                  color: Colors
                                                                                                                      .white,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                  ),
                                                                                                ));
                                                                                          });
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 29.0,
                                                                                      width: 104.38,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color
                                                                                            .fromRGBO(
                                                                                            240,
                                                                                            187,
                                                                                            98,
                                                                                            1),
                                                                                        borderRadius: BorderRadius
                                                                                            .circular(
                                                                                            20),
                                                                                      ),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsets
                                                                                                .all(
                                                                                                5.0),
                                                                                            child: Text(
                                                                                              'Pick Up',
                                                                                              style: TextStyle(
                                                                                                fontSize: 14,
                                                                                                fontWeight: FontWeight
                                                                                                    .w700,
                                                                                                color: Color
                                                                                                    .fromRGBO(
                                                                                                    255,
                                                                                                    255,
                                                                                                    255,
                                                                                                    1),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          child: Container(
                                                            height: 29.0,
                                                            width: 104.38,
                                                            decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromRGBO(
                                                                  240, 187, 98,
                                                                  1),
                                                              borderRadius: BorderRadius
                                                                  .circular(20),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .all(2.0),
                                                                  child: Text(
                                                                    'View',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight
                                                                          .w700,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
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
                        ],),
                    );
                  });
            }else{
              return CircularProgressIndicator();
            }
          }

        )
        );
  }
}

