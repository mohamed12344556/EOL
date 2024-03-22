import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class plan_note extends StatelessWidget {
  const plan_note({
    required this.title,
    required this.icon,
    required this.onpress,
    super.key,
  });
final String title ;
final IconData icon;
final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
                            leading: Container(
                                  width: 43,height: 43,
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
    color: Color.fromARGB(255, 20, 94, 1).withOpacity(0.4),
                                ) ,
                                child:  Icon(icon,size: 35,), 
                                ),
                                title: Text(title,style: TextStyle(fontSize: 35,fontFamily:'EBGaramond-Italic-VariableFont_wght.ttf' ),),
    //                             trailing: Container(
    //                               width: 30,height: 30,
    //                             decoration:BoxDecoration(
    //                               borderRadius: BorderRadius.circular(100),
    // color: Colors.grey.withOpacity(0.2),
    //                             ) ,
    //                             child: const Icon(LineAwesomeIcons.angle_right,size: 18.0,color: Colors.grey,),
    //                             ),
                              );
  }
}
