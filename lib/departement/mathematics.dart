import 'package:flutter/material.dart';
import 'package:high_school/list_subject.dart';

class mathematics extends StatefulWidget {
  const mathematics({super.key});

  @override
  State<mathematics> createState() => _mathematicsState();
}

class _mathematicsState extends State<mathematics> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          leading: IconButton (
              onPressed: () {  },
              icon:Icon(Icons.menu_outlined),
            color: Colors.blue,
          ),
            title: Center(child: Text('Subjects' ,style: TextStyle(color: Colors.amber,fontSize: 35,fontWeight: FontWeight.bold),)),

            actions: [ IconButton(
            icon: Text('EOL' ,style: TextStyle(color: Colors.blue,fontSize: 13,),),
            onPressed: () {
              // إضافة السلوك عند النقر على زر الإعدادات
            },
          ),]

        ),
        body:  SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            buildCustomElevatedButton('لغة عربيه'),
            buildCustomElevatedButton('لغة انجليزيه'),
            buildCustomElevatedButton('لغة ثانيه'),
            buildCustomElevatedButton('كمياء'),
            buildCustomElevatedButton('فزياء'),
            buildCustomElevatedButton('رياضة تطبيقية'),
            buildCustomElevatedButton("رياضة باحته")
          ],
        ),)
      ),
    );
  }
  Widget buildCustomElevatedButton(String label) {
    return SizedBox(
      height: 80,
      width: 600,
      child: IconButton(

          onPressed: () {  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => list()),
          ); },
          icon:  Container(

              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],

              ),
              child:Text('           '+label,style: TextStyle(color: Colors.blue,fontSize: 20),)


          )),
    );
  }

}
