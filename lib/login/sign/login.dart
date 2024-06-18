import 'package:flutter/material.dart';
import 'package:high_school/componet/crud.dart';
import 'package:high_school/componet/valid.dart';
import 'package:high_school/constant/link.dart';
import 'package:high_school/login/sign/sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:high_school/main.dart';
class login extends StatefulWidget {
  const login({Key? key}): super(key: key);
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {


GlobalKey<FormState> formstate=GlobalKey();
Crud crud = new Crud();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
bool isLoading=false;

login()async{

if (formstate.currentState!.validate()) {
  isLoading=true;
  setState(() {
    
  });
 var response= await crud.postRequest(linkLogin, {
  "username":email.text,
  "password":password.text
});
isLoading=false;
setState(() {
});
if (response["status"]=="success") {
  sharepref.setString("id", response['data']['id'].toString());
  sharepref.setString("username", response['data']['username']);
  sharepref.setString("email", response['data']['email']);
  Navigator.of(context).pushNamedAndRemoveUntil("home_scientific", (route) => false);
} else{
  AwesomeDialog(context: context,
  
  title: "alert",
  body: Text(
    "Email or Password is incorrect or the account does not exist"))
  ..show();
}
}
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(   
       body:
          Center(

         child:Padding(
           padding: const EdgeInsets.all(10.0),
           child:isLoading==true? Center(child: CircularProgressIndicator(),):Form(
            key: formstate,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Text('EOL' ,
                style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily:'EBGaramond-Italic-VariableFont_wght.ttf')),
                Text("welcomeback to EOL",style: 
                TextStyle(
                color: Color(0xFF102C57),
                fontSize:30,
                fontWeight: FontWeight.bold,
                fontFamily:'EBGaramond-Italic-VariableFont_wght.ttf')),
                SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0,left: 15),
                    child: TextFormField(
                      validator: (value) {
                        return validinput(value!, 3, 20);
                        },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                         border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF102C57),width: 1.5),
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
                      child: TextFormField(
                        validator: (value) {
                        return validinput(value!, 3, 10);
                        },
                        controller: password,
                        obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key,color: Colors.black,),
                         border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF102C57),width: 1.5),
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
               backgroundColor:MaterialStateProperty.all(Color(0xFF102C57)),
               shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
             
             ),
                        onPressed: ()async{
             
             
                      await  login();
                      },
                      child: Text("login",style: TextStyle(color: Color.fromARGB(255, 253, 251, 251)),),
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
                    color: Color(0xFF102C57),
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
       ),

     ), );
  }

}


