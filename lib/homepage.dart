import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count=0;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
 Timer.periodic(Duration(seconds: 1), (timer) {
   count++;
   setState(() {

   });
 });
 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subscribe"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(count.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
