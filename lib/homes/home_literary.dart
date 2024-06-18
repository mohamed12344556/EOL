import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:high_school/account-1/account.dart';
import 'package:high_school/componet/crud.dart';
import 'package:high_school/constant/link.dart';
import 'package:high_school/contact_view.dart';
import 'package:high_school/login/sign/login.dart';
import 'package:high_school/main.dart';
import 'package:high_school/plan/cardnote.dart';
import 'package:high_school/plan/note/editenote.dart';
import 'package:high_school/plan/plan_note_showbottom.dart';
import 'package:lottie/lottie.dart';

class homeliterary extends StatefulWidget {
  const homeliterary({super.key});

  @override
  State<homeliterary> createState() => _homeliteraryState();
}
class _homeliteraryState extends State<homeliterary> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

Crud crudnoteliterary=Crud();

getnote()async{

  var response = await crudnoteliterary.postRequest(linkViewNote, {
    "id":sharepref.getString("id"),
  });
  return response ;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 82, 1),
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
           
             ListTile(title: const Text("Profile"),
            leading: const Icon(Icons.account_balance_rounded),
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>account() )));},
            ),
            ListTile(title: const Text("order"),
            leading: const Icon(Icons.check_box),
            onTap: (){},
            ),
            ListTile(title: const Text("contact us"),
            leading: const Icon(Icons.phone_android_outlined),
            onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ContactView())));},
            ),
            ListTile(title: const Text("logout"),
            leading: const Icon(Icons.exit_to_app),
            onTap: (){
              sharepref.clear();
              Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
            },
            ),
            ],

          ),
        ),

      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,23,34,131),
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
        body:SafeArea(
         child: Padding(
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
                        onTap: (){},
                        child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255,23,34,131),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 120,
                            child:  const Center(child: Text('Subject',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))),
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
                              color: Color.fromARGB(255,23,34,131),
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
                        onTap: (){
                           scaffoldkey.currentState!.showBottomSheet((context) => 
                            Container(
                              height: 400,
                              width: 1000,
                              color: Color.fromARGB(255, 250, 250, 248),
                              child: Column(
                                children: [
                                  const SizedBox(height: 30,),
                                  plan_note(title: "plan",icon: Icons.calendar_today,onpress: (){},),
                                  const SizedBox(height: 10,),
                                  plan_note(title: "note",icon: Icons.article,onpress: (){
                                   Navigator.of(context).pushNamed("addnote");
                                  },),
                                  const SizedBox(height: 5,),
                                    ListView(
                                      children: [
                                        const SizedBox(width: 10,),
                                        FutureBuilder(
                                        future:getnote() ,
                                        builder: (BuildContext context,AsyncSnapshot snapshot) {
                                         if (snapshot.hasData) { 
                                          if(snapshot.data['status']=='fail')
                                          return Center(child: Text("there is no notes",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),);
                                          return ListView.builder(
                                            itemCount: snapshot.data['data'].length,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (context,i){
                                            return cardnote(ontap: (){
                                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>editenote(notes:snapshot.data['data'][i] ,)));


                                            }, title: "${snapshot.data['data'][i]['notes_title']}", content: "${snapshot.data['data'][i]['notes_content']}");
                                          });
                                         }
                                         if (snapshot.connectionState==ConnectionState.waiting) {
                                           return Center(child: Text("loading . . ."),);
                                         }
                                        return Center(child: Text("loading . . ."),);
                                       },)
                                        
                                      ],
                                    )
                                   ],
                           ),
                         )
                        );
                        },
                        child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255,23,34,131),
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
                        onTap: (){
                           Navigator.of(context).pushNamed("chooseplan_and_ask");
                        },
                        child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255,23,34,131),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 120,
                            child:  const Center(child: Text(' make a plan/ask',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
       
        ),
        );

  }

}
