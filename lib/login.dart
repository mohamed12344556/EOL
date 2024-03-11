import 'package:flutter/material.dart';
import 'package:high_school/home.dart';
import 'package:high_school/sign_in.dart';
class login extends StatefulWidget {
  const login({Key? key}): super(key: key);
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        
         
        
       body:
          Center(

         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text('EOL' ,
              style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily:'EBGaramond-Italic-VariableFont_wght.ttf')),
              Text("welcomeback to EOL",style: 
              TextStyle(
              color: Color.fromARGB(255, 23, 34, 131),
              fontSize:30,
              fontWeight: FontWeight.bold,
              fontFamily:'EBGaramond-Italic-VariableFont_wght.ttf')),
              SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0,left: 15),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 23, 34, 131),width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.black,width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                         ),
                     prefixIcon:  Icon(Icons.person,color: Colors.black,),
                      label: Text("email",style: TextStyle(color: Colors.black),)
                    ), ),
                ),
              SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key,color: Colors.black,),
                       border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber,width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.black,width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                         ),
                      label: Text("password",style: TextStyle(color: Colors.black))
                    ), ),
                  ),
               SizedBox(
                 height: 16,
               ),
             Container(
               width: 80,
               decoration: BoxDecoration(
               shape: BoxShape.circle,
               ),
               child: ElevatedButton(
                      style: ButtonStyle(
  backgroundColor:MaterialStateProperty.all(Colors.amber),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

),
                      onPressed: (){


                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>home()));
                    },
                    child: Text("login",style: TextStyle(color: Colors.black),),
                    ),
             ) ,
             SizedBox(height:10),

             Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text("Donot have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>sign_in()));
                },
                    child: Text("Register",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 15,
                ),
                )
                )
              ],

             ),


                  SizedBox(
                 height: 20,
               ),
             ],
           ),
         ),
       ),

     ), );
  }

}


