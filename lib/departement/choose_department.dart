

import 'package:flutter/material.dart';

import 'package:high_school/homes/home_literary.dart';
import 'package:high_school/homes/home_mathematics.dart';
import 'package:high_school/homes/home_scientific.dart';

import 'package:high_school/model.dart';



class choose_department extends StatefulWidget {
  const choose_department({super.key});

  @override
  State<choose_department> createState() => _choose_departmentState();
}

class _choose_departmentState extends State<choose_department> {
late final String val;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          backgroundColor: Color(0xFF102C57),
          appBar: AppBar(
        backgroundColor: Color(0xFF102C57),
        elevation: 0,
        centerTitle: true,
        title: const Text('EOL' ,
          style: TextStyle(
              color: Colors.white,
              fontSize: 70,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontFamily:'Smooch-Regular'),),
       
      ),
          body: SafeArea(
            child: Padding(padding: const EdgeInsets.only(left: 25.0,right: 25,top: 60,bottom: 90),
            child: Container(
            height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width:450,
                child: Column(
                children: [
             Center(child: Text('Choose your depatment',style: TextStyle(color: Colors.black,fontSize: 30,fontFamily:'Ephesis-Regular'),)),
             const SizedBox(height: 20,),
             Padding(
                           padding: const EdgeInsets.only(right: 90.0,left: 90),
                  child: Container(
                    height:50,
                    width: 500,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ElevatedButton(
            
                      style: ButtonStyle(
            
                        backgroundColor:MaterialStateProperty.all(Color(0xFF102C57)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            
                      ),
                      onPressed: (){
                        setState(() {
                          //val.value="علوم";
                        });
            
            
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>homescientific()));
                      },
                      child: Text('scientific',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                ) ,
             const SizedBox(height: 20,),
             Padding(
                           padding: const EdgeInsets.only(right: 90.0,left: 90),
                  child: Container(
                    height: 55,
                    width: 500,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Color(0xFF102C57)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            
                      ),
                      onPressed: (){
            
             setState(() {
                         // value="رياضة";
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>homemathematics()));
                      },
                      child: Text('mathematics ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
                ) ,
            const SizedBox(height: 20,),
             Padding(
                           padding: const EdgeInsets.only(right: 90.0,left: 90),
                  child: Container(
                    height: 55,
                    width: 500,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 20, 94, 1)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            
                      ),
                      onPressed: (){
            
             setState(() {
                         // value="ادبى";
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>homeliterary()));
                      },
                      child: Text(' literary ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                  ),
                ) ,
            
                           ],
            ),
            
            ), ),
          ));
  }

} 