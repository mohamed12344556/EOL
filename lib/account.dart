import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:high_school/src/text.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}
class _accountState extends State<account> {
  

  @override
  Widget build(BuildContext context) {
      var isDark =MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          
        }, icon: const Icon(LineAwesomeIcons.angle_left)),
        title:const Text("profile"),
        actions: [
         IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun:LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.only(left: 25.0,right: 25,top: 60,bottom: 90),
        child: Column(
          children: [
            SizedBox(
              width: 120,height: 120,
        child: ClipRRect(
   borderRadius: BorderRadius.circular(100),
   child: Image.asset('images/face.PNG',fit: BoxFit.cover,),
            )
            ),
            const SizedBox(height: 15,),
            const Expanded(child:ListTile(
  title: Text("ibrahim"),
  subtitle: Text("ibrahimmahmed@gmail.com",maxLines: 1,style: TextStyle(fontSize: 13),),
),),
            SizedBox(width: 200 ,child: ElevatedButton(onPressed: (){}, child: const Text("edite"),
    
            
            ))
          ],
        ), 
        ),
      ),
    );
   
    }
}