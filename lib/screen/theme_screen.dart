
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class Themescreen extends StatefulWidget {
  const Themescreen({super.key});

  @override
  State<Themescreen> createState() => _ThemescreenState();
}

class _ThemescreenState extends State<Themescreen> {
  @override
  Widget build(BuildContext context) {

    final themechange =Provider.of<Themeprovider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Theme change screen"),),
      body: Column(
        children: [
 RadioListTile<ThemeMode>(
   title: Text("Light"),
     value: ThemeMode.light,
     groupValue: themechange.themedata,
     onChanged: themechange.setTheme

 ),
          RadioListTile<ThemeMode>(
            title: Text("Dark"),
              value:ThemeMode.dark,
              groupValue: themechange.themedata,
              onChanged: themechange.setTheme
          ),
        //  RadioListTile(value: ThemeMode.system, groupValue: groupValue, onChanged: onChanged)
          Icon(Icons.account_box)
        ],
      ),
    );
  }
}
