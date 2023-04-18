import 'package:flutter/material.dart';
import 'package:annachhatra/screens/donation_screen.dart';
import 'package:annachhatra/screens/pickup_screen.dart';
import 'package:annachhatra/screens/login_screen.dart';


class SideScreen extends StatelessWidget {
  static const String id = 'side_screen';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 261,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color.fromRGBO(240,187,98,1),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 190.0,right: 130),
                      child: Text(
                  'Rohini Tarpe',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(255,255,255,1),
                  ),
                ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('View Donations',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    color: Color.fromRGBO(100, 100, 100, 1)
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, DonationScreen.id);
              },
            ),
            ListTile(
              title: Text('Pick up Orders',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                    color: Color.fromRGBO(100, 100, 100, 1)
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, PickUpScreen.id);
              },
            ),
            ListTile(
              leading: Image.asset('images/logout_btn.png'),
              title:
              Transform.translate(
                offset: Offset(-30,0),
                child: Text('Log Out',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(100, 100, 100, 1)
                  ),
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
      );
  }
}
