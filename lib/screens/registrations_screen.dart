import 'package:flutter/material.dart';
import 'package:annachhatra/screens/home_screen.dart';
import 'package:annachhatra/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

 class RegistrationScreen extends StatefulWidget {

  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}
 class _RegistrationScreenState extends State<RegistrationScreen> {
   var image;
  final _auth = FirebaseAuth.instance;
  late String email,password,verify_password,organization,address;
   //FirebaseStorage _storage = FirebaseStorage.instance;

  // uploadImage() async{
  //   final picker = ImagePicker();
  //   var pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //   var storageref = _storage.ref('image');
  //   File a = new File(image!.path);
  //   var task = storageref.putFile(a);
  //   setState(() {
  //     image = pickedImage!.path;
  //   });
  // }
  //  uploadImage() async{
  //    final _firebaseStorage = FirebaseStorage.instance;
  //    final _imagePicker = ImagePicker();
  //    PickedFile image;
  //
  //    image = (await _imagePicker.pickImage(source: ImageSource.gallery)) as PickedFile;
  //    var file = File(image.path);
  //    if(image != null){
  //      var snapshot = await _firebaseStorage.ref()
  //          .child('image')
  //          .putFile(file).whenComplete(() => image);
  //      var downloadUrl = await snapshot.ref.getDownloadURL();
  //      setState(() {
  //        imageUrl = downloadUrl;
  //      });
  //    }
  //  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 130.0,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(81,146,89,1),
                ),
            child: Padding(
              padding:  EdgeInsets.only(top: 80.0,left: 19.0),
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
                padding: EdgeInsets.only(left: 23.0,top: 10.0,bottom: 20.0),
                child: Text(
                  'Registration',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(81,146,89,1),
                ),
                ),
              ),
              Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                     //uploadImage();
                      new myupload().uploadPic();
                    },
                    child: Container(
                      //this code is to show image
                      child: image != null ? Image.file(File(image),fit: BoxFit.cover,): null,
                      height: 136.0,
                      width: 185.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196,196,196,1),
                      ),
                    ),
                  ),
                ],
              ),
            // RegistrationData(email: email, password: password,),
          Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                onChanged: (value){
                  organization = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Organization/ hotel name'),
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                onChanged: (value){
                  address = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Address'),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.left,
                onChanged: (value){
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'e-mail'),
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.left,
                onChanged: (value){
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.left,
                onChanged: (value){
                  verify_password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'verify password'),
              ),
            ],
          ),
              SizedBox(height: 20.0,),
              Column(
                children: [
                  Material(
                    elevation: 5.0,
                    color: Color.fromRGBO(240, 187, 98, 1),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () async {
                        new myupload().uploadPic();
                     try{
                       final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                       if(newUser != null){
                        Navigator.pushNamed(context, HomeScreen.id);

                       }
                     }
                     catch(e){
                       print(e);
                     }
                    },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text('Register',
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
      ),
    );
  }
}

class myupload{
FirebaseStorage _storage = FirebaseStorage.instance;
void uploadPic() async{
  PickedFile? _image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  var storageref = _storage.ref('images/');
  File a = new File(_image!.path);
  var task = storageref.putFile(a);
}
}



