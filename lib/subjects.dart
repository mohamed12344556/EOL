import 'package:flutter/material.dart';
import 'package:high_school/list_subject.dart';

class subjects1 extends StatefulWidget {
  const subjects1({super.key});

  @override
  State<subjects1> createState() => _subjects1State();
}

class _subjects1State extends State<subjects1> {
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
            title: Center(child: Text('Subjects' ,style: TextStyle(color: Colors.blue,fontSize: 35,fontWeight: FontWeight.bold),)),

            actions: [ IconButton(
            icon: Text('EOL' ,style: TextStyle(color: Colors.blue,fontSize: 13,),),
            onPressed: () {
              // إضافة السلوك عند النقر على زر الإعدادات
            },
          ),]

        ),
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            buildCustomElevatedButton('لغة عربيه'),
            buildCustomElevatedButton('لغة انجليزيه'),
            buildCustomElevatedButton('لغة ثانيه'),
            buildCustomElevatedButton('كمياء'),
            buildCustomElevatedButton('فزياء'),
            buildCustomElevatedButton('احياء'),
            buildCustomElevatedButton('جلوجيا')
          ],
        ),
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

