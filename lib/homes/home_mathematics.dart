import 'package:flutter/material.dart';
import 'package:high_school/Subjects/submathmatics.dart';
import 'package:high_school/account.dart';
import 'package:high_school/login.dart';
import 'package:lottie/lottie.dart';

class homemathematics extends StatefulWidget {
  const homemathematics({super.key});

  @override
  State<homemathematics> createState() => _homemathematicsState();
}
class _homemathematicsState extends State<homemathematics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[600],
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(children: [
SizedBox(width: 60,height: 60,
child: ClipRRect(
   borderRadius: BorderRadius.circular(60),
   child: Image.asset('images/face.PNG',fit: BoxFit.cover,),
),),
const Expanded(child:
ListTile(
  title: Text("ibrahim"),
  subtitle: Text("ibrahimmahmed@gmail.com",maxLines: 1,style: TextStyle(fontSize: 13),),
),)
            ],),
           
             ListTile(title: const Text("Account"),
            leading: const Icon(Icons.account_balance_rounded),
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: ((context) => account())));},
            ),
            ListTile(title: const Text("order"),
            leading: const Icon(Icons.check_box),
            onTap: (){},
            ),
            ListTile(title: const Text("contact us"),
            leading: const Icon(Icons.phone_android_outlined),
            onTap: (){},
            ),
            ListTile(title: const Text("logout"),
            leading: const Icon(Icons.exit_to_app),
            onTap: (){
               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const login()));
            },
            ),
            ],

          ),
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        elevation: 0,
        centerTitle: true,
        title: const Text('EOL' ,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontFamily:'Smooch-Regular'),),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
        body:  Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25,top: 60,bottom: 90),
            child: Container(
        
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0,left: 30),
                        child: InkWell(
                          onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>submathematics()),);
                          },
                          child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 120,
                              child:  const Center(child:
                              
                               Text('Subject',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                              ))),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0,left: 15),
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 120,
                              child:  const Center(child: Text('Community',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Center(child: Lottie.asset('images/Animation - 1701549531524.json',width: 200,height: 80)),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 30),
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 120,
                              child:  const Center(child: Text('Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 15),
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.amber[600],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 120,
                              child:  const Center(child: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))),
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
