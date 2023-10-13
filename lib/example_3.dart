
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/adduser.dart';

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Examole3State();
}

class _Examole3State extends State<Example3> {
  List<Adduser> adduser=[];
  Future<List<Adduser>>getadress()async{
    final responce=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(responce.body.toString());
    if(responce.statusCode==200){
      for(Map<String ,dynamic>i in data){
        adduser.add(Adduser.fromJson(i));
      }
      return adduser;
    }
    else {
      return adduser;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Apps"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future:getadress() ,
                builder: (context,snapshot){
    if(!snapshot.hasData){
    return CircularProgressIndicator();
    }
    else{
    return ListView.builder(
        itemCount: adduser.length,
        itemBuilder: (context,index){
return Card(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Reusablerow(title: "Name", value: adduser[index].name.toString()),
        Reusablerow(title: "UserName", value:adduser[index].username.toString()),
        Reusablerow(title: "email", value: adduser[index].email.toString()),
        Reusablerow(title: "Address", value: adduser[index].address.city.toString())
      ],
    ),
  ),
);
    });
    }
            }),
          )
        ],
      )
    );
  }
}

class Reusablerow extends StatelessWidget {
  String title,value;
  Reusablerow({super.key, required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value)
          ],
        ),
      );
  }
}
