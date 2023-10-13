
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController emailtext =TextEditingController();
  TextEditingController passowrdtext =TextEditingController();
  void login(String email,password)async{
    try{
Response response= await post(Uri.parse("https://reqres.in/api/register"),
body:{
  "email":email,
    "password":password
});
if(response.statusCode==200){
  var data=jsonDecode(response.body.toString());
  print(data);
  print("Login Success");
}else{
  print('Login Fail');
}
    }

    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Apps"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailtext,
              decoration: InputDecoration(
                hintText: "enter email"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passowrdtext,
              decoration: InputDecoration(
                hintText: "Enter Password"
              ),
            ),
SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
           login(emailtext.text.toString(),passowrdtext.text.toString());
              },
              child: Container(
                height: 40,
                width: double.infinity,
                // color: Colors.green,
                decoration: BoxDecoration(
                    color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Signup")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
