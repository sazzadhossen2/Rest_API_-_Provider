
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/post/modelposts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
List<Modelposts> posts=[];
Future<List<Modelposts>>getapi()async{
  final responce = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var data =jsonDecode(responce.body.toString());
  if(responce.statusCode==200){
    for(Map i in data){
      posts.add(Modelposts.fromJson(i));
  }
    return posts;
  }
  else{
    return posts;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Apps"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future:getapi(),
                builder: (context , snapshot){
             if(!snapshot.hasData){
                return Text("Loading");
              }
              else{
              return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      title: Text(posts[index].id.toString()),
                    ),
                  );
                });
              }
                }),
          )
          
          // FutureBuilder(future: getapi(),
          //     builder: (context,snapshot){
          //   if(snapshot.hasData){
          //     return Text("Loading");
          //   }else{
          //     return ListView.builder(itemBuilder: (context,index){
          //      
          //     });
          //   }
          //     })
        ],
      ),
    );
  }
}
