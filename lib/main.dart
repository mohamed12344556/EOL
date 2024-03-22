import 'package:flutter/material.dart';
import 'package:high_school/login/sign/login.dart';
import 'package:high_school/plan/note/addnote.dart';
import 'package:high_school/plan/note/editenote.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: login (),
      routes: {
        "addnote":(context) =>  addnote(),
        "editenote":(context) =>  editenote(),
      },              
    );
  }
}