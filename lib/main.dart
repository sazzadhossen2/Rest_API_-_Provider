import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/homepage.dart';
import 'package:livetest/provider/provider.dart';
import 'package:livetest/provider/provider2.dart';
import 'package:livetest/screen/screen.dart';
import 'package:livetest/screen/screen2.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(Myapps());
}
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>MultipolProvider(),

        ),],
      child: MaterialApp(
        home: Multipolproviders(),
      ),

    );


  }
}
