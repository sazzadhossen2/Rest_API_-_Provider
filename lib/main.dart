import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/homepage.dart';
import 'package:livetest/homepage2.dart';

void main(){
  runApp(Myapps());
}
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage2(),
    );
  }
}
