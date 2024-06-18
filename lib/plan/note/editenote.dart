

import 'package:flutter/material.dart';
import 'package:high_school/componet/crud.dart';
import 'package:high_school/componet/valid.dart';
import 'package:high_school/constant/link.dart';
import 'package:high_school/main.dart';
import 'package:high_school/plan/note/custtextform.dart';

class editenote extends StatefulWidget {
  final notes ;
  const editenote({super.key, this.notes});

  @override
  State<editenote> createState() => _editenoteState();
}

class _editenoteState extends State<editenote> {

GlobalKey<FormState> formstate =GlobalKey<FormState>();
TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();
Crud crudedite=Crud();
bool isLoading =false;

editenote()async{
 if (formstate.currentState!.validate()) {
    isLoading=true;
    setState(() {

    });
    var response =await crudedite.postRequest(linkUpdateNote,{
"title":title.text,
"content":content.text,
"id":widget.notes['notes_id'].toString(),
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
  void initState() {
    title.text=widget.notes['notes_title'];
    content.text=widget.notes['notes_content'];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edite note"),
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
                    await editenote();
              },
              child: Text("edite"),
              
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