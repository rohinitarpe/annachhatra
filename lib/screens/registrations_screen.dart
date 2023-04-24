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
   String imageUrl = '';
  final _auth = FirebaseAuth.instance;
  late String email,password,verify_password,organization,address,hotelimage;
  // FirebaseStorage _storage = FirebaseStorage.instance;
   final firebase = FirebaseFirestore.instance;

   TextEditingController hotelnameController = TextEditingController();
   TextEditingController addressController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController verifypaswrdController = TextEditingController();

  // final imageUrlController = TextEditingController();
   

   // create() async{
   //   try{
   //     await firebase.collection('user').doc(hotelnameController.text).set({
   //       'hotelname': hotelnameController.text, 'address': addressController.text,});
   //   }catch(e){
   //     print(e);
   //   }
   // }

  // void uploadPic() async {
  //   final Image = await ImagePicker().pickImage(source: ImageSource.gallery,);
  //   Reference ref = FirebaseStorage.instance.ref().child('');
  //
  //   await ref.putFile(File(Image!.path));
  //   ref.getDownloadURL().then((value) {
  //     print(value);
  //     setState(() {
  //       imageUrl = value;
  //     });
  //   });
  // }

  ImagePicker image = ImagePicker();
  String url ='';
  File? file;
  getImage() async{
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  uploadFile() async{
    var imageFile = await FirebaseStorage.instance.ref().child('path').child('/jpg');
    UploadTask task = imageFile.putFile(file!);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance.collection('users').add({'imageUrl' : url});
    print(url);
  }

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
                  InkWell(
                    onTap: () {
                     //uploadPic();
                      getImage();
                      uploadFile();
                    },
                    child: Container(
                      //this code is to show image
                      //child: image != null ? Image.file(File(image),fit: BoxFit.cover,): null,
                      height: 136.0,
                      width: 185.0,
                      // backgroundImage: file == null? AssetImage('')
                      //     :FileImage(File(file!.path)) as ImageProvider,
                      // child: imageUrl == '' ?
                      // Icon(Icons.add,color: Colors.grey,): Image.network(imageUrl),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196,196,196,1,),
                      ),
                    ),
                  ),
                ],
              ),
            // RegistrationData(email: email, password: password,),
          Column(
            children: [
              TextField(
                controller: hotelnameController,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                onChanged: (value){
                  organization = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Organization/ hotel name'),
              ),
              TextField(
                controller: addressController,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                onChanged: (value){
                  address = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Address'),
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.left,
                onChanged: (value){
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'e-mail'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                textAlign: TextAlign.left,
                onChanged: (value){
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
              ),
              TextField(
                controller: verifypaswrdController,
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
                     try{
                       final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password)
                           .then((value){
                             firebase.collection('users').add({
                          'hotelname' : hotelnameController.text,
                          'address' : addressController.text,
                          // 'email': emailController.text,
                          //  'pic url' : hotelnameController.text
                             });
                      Navigator.pushNamed(context, HomeScreen.id);
                      });
                       if(newUser != null){
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

// StreamBuilder<QuerySnapshot>(
// stream:  FirebaseFirestore.instance.collection('users').snapshots(),
// builder: (context,snapshot){
// List<Row> userWidgets = [];
// if(snapshot.hasData)
// {
// final users = snapshot.data?.docs.reversed.toList();
// for(var user in users!)
// {
// final userWidget = Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(user['hotelname']),
// Text(user['address']),
// //Text(user['hotelname']),
// ],
// );
// userWidgets.add(userWidget);
// }
// }
// return Expanded(
// child: ListView(
// children: userWidgets,
// ),
// );
// }
// )


