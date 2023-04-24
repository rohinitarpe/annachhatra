import 'package:annachhatra/models/food_data.dart';
import 'package:flutter/material.dart';
import 'package:annachhatra/screens/login_screen.dart';
import 'package:annachhatra/screens/registrations_screen.dart';
import 'package:annachhatra/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:annachhatra/screens/side_screen.dart';
import 'package:annachhatra/screens/fooddetail_screen.dart';
import 'package:annachhatra/screens/donate_screen.dart';
import 'package:annachhatra/screens/donation_screen.dart';
import 'package:annachhatra/screens/pickup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>FoodData()),
       // ChangeNotifierProvider(create: (context)=>HotelData()),
      ],
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id : (context) => LoginScreen(),
          RegistrationScreen.id : (context) => RegistrationScreen(),
          HomeScreen.id : (context) => HomeScreen(),
          SideScreen.id : (context) => SideScreen(),
          //FoodDetailScreen.id : (context) => FoodDetailScreen(),
          DonateScreen.id : (context) => DonateScreen(),
          DonationScreen.id : (context) =>DonationScreen(),
          PickUpScreen.id : (context) => PickUpScreen(),
        },
      ),
    );
  }
}

class AddData extends StatelessWidget {
  final db = FirebaseFirestore.instance.collection('orders').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StreamBuilder(
        stream: db,
        builder: (context,snapshot){
          if(!snapshot.hasData)return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,int index){
              return Text(snapshot.data!.docs[index]['orders']);
            }
          );
        },
      ),
    );
  }
}
