import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/homepage.dart';
import 'package:livetest/provider/favourite.dart';
import 'package:livetest/screen/favorite_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(Myapps());
}

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[ ChangeNotifierProvider(
      create:(_)=> Fovider(),
    )],
      child:MaterialApp(
        home: Foviderscreen(),
      ),
    );


  }
}
