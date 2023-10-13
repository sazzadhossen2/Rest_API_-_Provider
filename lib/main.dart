import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/homepage.dart';
import 'package:livetest/provider/provider.dart';
import 'package:livetest/screen/screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(Myapps());
}
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_)=>Countprovider(),
      child: MaterialApp(
        home: Screen(),
      ) ,

    );

  }
}
