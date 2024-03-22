import 'package:flutter/material.dart';

class subscientific extends StatefulWidget {
  const subscientific({super.key});

  @override
  State<subscientific> createState() => _subscientificState();
}

class  _subscientificState extends State<subscientific> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
 appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('EOL' ,
          style: TextStyle(
              color: Colors.black,
              fontSize: 70,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontFamily:'Smooch-Regular'),),
       
      ),
 body: SingleChildScrollView(
child: Column(
  
),




 ),),
    );
  }
}