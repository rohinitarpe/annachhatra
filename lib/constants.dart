import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black)
  )
);
const kLoginButton = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow)
  )
);
