import 'package:flutter/material.dart';

import 'Product_Screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home screen"),),

      body: Center(
        child: TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context){
            return Productscreen();
          }));

        }, child:Text("Get Product lists")),
      ),);
  }
}
