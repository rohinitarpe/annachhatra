import 'package:flutter/material.dart';
import 'package:annachhatra/constants.dart';
import 'package:annachhatra/screens/registrations_screen.dart';
import 'package:annachhatra/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
             height: 280.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(81, 146, 89, 1)
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 220,left: 19.0),
                child: Text('Anna Chatra',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Montserrat',
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 23.0,top: 20.0,bottom: 30.0),
              child: Text('Log In',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.w800,
                fontFamily: 'Montserrat',
                color: Color.fromRGBO(81, 146, 89, 1)
              ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              onChanged: (value){
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'e-mail'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              onChanged: (value){
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                    child: Text('Not registered ?',
                    style: TextStyle(
                      color: Color.fromRGBO(74,190,255,1),
                      fontFamily: 'Montserrat',
                    )
                    )
                ),
              ],
            ),
            Column(
              children: [
                Material(
                  elevation: 5.0,
                  color: Color.fromRGBO(240, 187, 98, 1),
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: (){
                      try{
                        final user = _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user != null){
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      }catch(e){
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text('Log In',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                      color: Color.fromRGBO(100, 100, 100, 1)
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
