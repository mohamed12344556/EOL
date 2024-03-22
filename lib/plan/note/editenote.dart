import 'package:flutter/material.dart';
import 'package:high_school/plan/note/custtextform.dart';

class editenote extends StatefulWidget {
  const editenote({super.key});

  @override
  State<editenote> createState() => _editenoteState();
}

class _editenoteState extends State<editenote> {
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
TextEditingController title = TextEditingController();
TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edite note"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: 
        Form(
          key: formstate,
          child: ListView(
            children: [
             custtextform(hint: "title", mycontroller: title, valid: (val){},),
              custtextform(hint: "new content", mycontroller: title, valid: (val){},),
               Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(onPressed: (){
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