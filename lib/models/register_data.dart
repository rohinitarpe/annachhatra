// import 'package:flutter/material.dart';
// import 'package:annachhatra/screens/registrations_screen.dart';
// import 'package:annachhatra/constants.dart';
//
// class RegistrationData extends StatefulWidget {
//
//   //RegistrationData({required this.email,required this.password});
//
//   @override
//   State<RegistrationData> createState() => _RegistrationDataState();
// }
//
// class _RegistrationDataState extends State<RegistrationData> {
//    late String email,password,verify_password,organization,address;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           keyboardType: TextInputType.text,
//           textAlign: TextAlign.left,
//           onChanged: (value){
//             // organization = value;
//           },
//           decoration: kTextFieldDecoration.copyWith(hintText: 'Organization/ hotel name'),
//         ),
//         TextField(
//           keyboardType: TextInputType.text,
//           textAlign: TextAlign.left,
//           onChanged: (value){
//             //address = value;
//           },
//           decoration: kTextFieldDecoration.copyWith(hintText: 'Address'),
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           textAlign: TextAlign.left,
//           onChanged: (value){
//             //email = value;
//           },
//           decoration: kTextFieldDecoration.copyWith(hintText: 'e-mail'),
//         ),
//         TextField(
//           obscureText: true,
//           textAlign: TextAlign.left,
//           onChanged: (value){
//             //password = value;
//           },
//           decoration: kTextFieldDecoration.copyWith(hintText: 'password'),
//         ),
//         TextField(
//           obscureText: true,
//           textAlign: TextAlign.left,
//           onChanged: (value){
//             //verify_password = value;
//           },
//           decoration: kTextFieldDecoration.copyWith(hintText: 'verify password'),
//         ),
//       ],
//     );
//   }
// }