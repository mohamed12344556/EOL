

import 'package:flutter/material.dart';
import 'package:high_school/componet/crud.dart';
import 'package:high_school/componet/valid.dart';
import 'package:high_school/constant/link.dart';
import 'package:high_school/main.dart';
import 'package:high_school/plan/note/custtextform.dart';

class addnote extends StatefulWidget {
  const addnote({super.key});

  @override
  State<addnote> createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {

GlobalKey<FormState> formstate =GlobalKey<FormState>();
TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();
Crud crudadd=Crud();
bool isLoading =false;

addnote()async{
 if (formstate.currentState!.validate()) {
    isLoading=true;
    setState(() {

    });
    var response =await crudadd.postRequest(linkAddNote,{
"title":title.text,
"content":content.text,
"id":sharepref.getString("id"),
  } );
  isLoading=false;
  setState(() {
    
  });
  if (response['status']=="success") {
    Navigator.of(context).pop();
  }else{
    //
  }
 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add note"),
      ),
      body:isLoading==true?Center(child: CircularProgressIndicator(),): Container(
        padding: EdgeInsets.all(10),
        child: 
        Form(
          key: formstate,
          child: ListView(
            children: [
             custtextform(hint: "title", mycontroller: title, valid: (val){
              return validinput(val!,1 , 40);

             },),
              custtextform(hint: "new content", mycontroller: content, valid: (val){
return validinput(val!,5 , 255);

              },),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(onPressed: ()async{
                    await addnote();
              },
              child: Text("save"),
              
              textColor: Colors.white,
              color: Color.fromARGB(255, 20, 94, 1).withOpacity(0.4),
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