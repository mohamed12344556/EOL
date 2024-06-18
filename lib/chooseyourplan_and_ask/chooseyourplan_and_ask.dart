


import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';



class choiceplan_ask extends StatefulWidget {
  const choiceplan_ask({super.key});

  @override
  State<choiceplan_ask> createState() => _choiceplan_askState();
}

class _choiceplan_askState extends State<choiceplan_ask> {
 
  
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: AppColors.blue,
          appBar: AppBar(
        backgroundColor: AppColors.blue,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
children: [
 Container(
  height: 95,
       padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.bluelight,
            borderRadius: BorderRadius.circular(20),
           
          ),
          
      child: MaterialButton(onPressed: (){
        Navigator.of(context).pushNamed("chooseplan");
      },
      child: Text("make your plan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.2,color: Colors.white),),
      ),),
      const SizedBox(width: 15,),
     Container(
  height: 95,
       padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.bluelight,
            borderRadius: BorderRadius.circular(20),
           
          ),
          
      child: MaterialButton(onPressed: (){},
      child: Text("send pdf and ask ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.2,color: Colors.white),),
      ),),

],

                )
               ), ),
          ),
   

    );
  }
}