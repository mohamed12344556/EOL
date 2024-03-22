import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:high_school/departement/choose_department.dart';
import 'package:high_school/login/sign/login.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}
class _sign_inState extends State<sign_in> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email=TextEditingController();
  var dateController=TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0,right: 25,left: 25),
          child: ListView(
            children: [
              Center(
                child: Text('EOL' ,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 70,
                      fontFamily:'Smooch-Regular'),),
              ),
              Center(child: Text('Create an account',style: TextStyle(color: Color.fromARGB(255, 20, 94, 1),fontSize: 30,fontFamily:'Ephesis-Regular'),)),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child:
                     TextField(
                      controller: firstName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 20, 94, 1),width: 1.5),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.black,width: 1.5),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          prefixIcon:  Icon(Icons.person,color: Colors.black,),
                          label: Text("First Name",style: Theme.of(context).textTheme.bodySmall)
                      ), ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextField(
                      controller: lastName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 20, 94, 1),width: 1.5),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.black,width: 1.5),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          prefixIcon:  Icon(Icons.person,color: Colors.black,),
                          label: Text("Last Name",style: TextStyle(color: Colors.black),)
                      ), ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 20, 94, 1),width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.black,width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon:  Icon(Icons.person,color: Colors.black,),
                    label: Text("Email",style: TextStyle(color: Colors.black),)
                ), ),
              SizedBox(height: 20,),
              TextField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 20, 94, 1),width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.black,width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon:  Icon(Icons.date_range,color: Colors.black,),
                    label: Text("Date",style: TextStyle(color: Colors.black),)
                ),
                onTap: (){
                  showDatePicker(context: context,
                    initialDate:DateTime.now(),
                    firstDate: DateTime.parse('1900-01-01'),
                    lastDate:DateTime.parse('2100-12-03'), ).then((value){
                    dateController.text=DateFormat.yMMMd().format(value!);

                  });
                },
              ),
              SizedBox(height: 20,),
              IntlPhoneField(
              pickerDialogStyle: PickerDialogStyle(backgroundColor: Colors.white,),
              style: TextStyle(color:Colors.black
              ),
              initialCountryCode: 'IQ',
              languageCode: 'ar',
              cursorColor:  Colors.black,
              controller: phone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15.0),
                hintText: 'Phone number',
                hintStyle:TextStyle(color: Colors.black),
                iconColor: Colors.black,
                floatingLabelStyle:  TextStyle(color: Colors.black),
                labelStyle: TextStyle(color:Colors.black),
                fillColor:  Colors.black,
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide:  BorderSide(
                    color: Colors.black,

                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:BorderSide(color: Colors.black,width: 1.5),
                    borderRadius: BorderRadius.circular(50)
                ),

              )
          ),

           SizedBox(height: 10),
                 
                     TextField(
                controller: password,
                  obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 20, 94, 1),width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.black,width: 1.5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    prefixIcon:  Icon(Icons.key,color: Colors.black,),
                    label: Text("password",style: TextStyle(color: Colors.black),)
                ), ), 
                   SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 90.0,left: 90),
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 20, 94, 1)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

                    ),
                    onPressed: (){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>choose_department()));
                    },
                    child: Text("Register",style: TextStyle(color: Colors.black),),
                  ),
                ),
              ) ,
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text("Donot have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  },
                      child: Text("Login",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 15,
                        ),
                      )
                  )
                ],

              ),






            ],
          ),
        ),
      ),
    );
  }
}

