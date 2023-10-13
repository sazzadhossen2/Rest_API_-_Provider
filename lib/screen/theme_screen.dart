
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
  TextEditingController emailtext =TextEditingController();
  TextEditingController passwordtext=TextEditingController();
  @override
  Widget build(BuildContext context) {

final loadingcheek =Provider.of<Themeprovider>(context,listen: false);
print("XYZ");
    return Scaffold(
      appBar: AppBar(title: Text("Theme change screen"),),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
   TextFormField(
     controller: emailtext,
     decoration: InputDecoration(
         hintText: "Enter mail"

     ),
   ),
            SizedBox(height: 10,),
            TextFormField(
              controller: passwordtext,
              decoration: InputDecoration(
                hintText: "Enetr Password",

              ),

            ),
            SizedBox(height: 20,),

            Consumer<Themeprovider>(
              builder: (BuildContext context, value, Widget? child) {
              return InkWell(
                onTap: (){
                  value.Loagin(emailtext.text.toString(),passwordtext.text.toString());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child:value.loading? CircularProgressIndicator(color: Colors.white,): Text("Login")),
                ),
              );}
            ),
          ],
        ),
      ),
    );
  }
}
