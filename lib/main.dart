import 'package:flutter/material.dart';
//import 'package:high_school/chooseyourplan_and_ask/chooseplan/chooseplan.dart';

import 'package:high_school/chooseyourplan_and_ask/chooseyourplan_and_ask.dart';
import 'package:high_school/departement/choose_department.dart';
import 'package:high_school/homes/home_scientific.dart';
import 'package:high_school/login/sign/login.dart';
import 'package:high_school/plan/note/addnote.dart';
import 'package:high_school/plan/note/editenote.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences sharepref;  

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharepref= await SharedPreferences.getInstance();
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    
      initialRoute:"choose_department",
      //  sharepref.getString("id")==null?"login":"home_scientific",
      routes: {
        "addnote":(context) =>  addnote(),
        "editenote":(context) =>  editenote(),
        "chooseplan_and_ask":(context)=>choiceplan_ask(),
        "login":(context) => login(),
        //"chooseplan":(context)=>chooseyourplan(),
        "choose_department":(context) => choose_department(),
        "home_scientific":(context) => homescientific(),
      },              
    );
  }
}