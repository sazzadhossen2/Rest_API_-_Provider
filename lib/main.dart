import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/provider/theme_provider.dart';
import 'package:livetest/screen/theme_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(Myapps());
}

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[ ChangeNotifierProvider(
      create:(_)=> Themeprovider(),
    )],
      child:Builder(
        builder: (context) {
          final themechange =Provider.of<Themeprovider>(context);
          return MaterialApp(
            themeMode: themechange.themedata,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.green,
              primaryColor: Colors.purpleAccent,
              appBarTheme: AppBarTheme(
                color: Colors.green
              ),
              iconTheme: IconThemeData(
                color: Colors.purpleAccent
              )
            ),

            home: Themescreen(),
          );
        }
      ),
    );


  }
}
