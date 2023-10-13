
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Homepages extends StatefulWidget {
  const Homepages({super.key});

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
List<Photos>photolist=[];
Future<List<Photos>>getphoto()async{
  final responce =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  var data = jsonDecode(responce.body.toString());
  if(responce.statusCode==200){
    for(Map<String,dynamic>i in  data){
      Photos photos=Photos(id: i["id"], title: i["title"], url: i["url"]);
      photolist.add(photos);
    }
    return photolist;
  }else{
    return photolist;
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Apps"),),
      body: Column(
        children: [
   Expanded(
     child: FutureBuilder(future: getphoto(), builder:(context,snapshot){
       return ListView.builder(itemBuilder: (context,index){
         return ListTile(
           title:Text("Number id ${photolist[index].id.toString()}") ,
           subtitle: Text(photolist[index].title.toString()),
           leading: CircleAvatar(
             backgroundImage: NetworkImage(photolist[index].url.toString()),
           ),
         );
       });
     }),
   )
        ],
      ),
    );
  }
}


class Photos{
  String title,url;
  int id;
  Photos({
    required this.id,
    required this.title,
    required this.url
});
}

