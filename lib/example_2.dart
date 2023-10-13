
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
  
  List<Photos>phototolist=[];
  Future<List<Photos>>getphoto()async{
    final responce= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data= jsonDecode(responce.body.toString());
    if(responce.statusCode==200){
      for(Map<String,dynamic>i in data){
        Photos photos=Photos(title:i["title"], url: i["url"],id:i["id"]);
        phototolist.add(photos);
      }
      return phototolist;
    }
    else{
      return phototolist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Apps"),),
      body: Column(
        children: [
 Expanded(
   child: FutureBuilder(future: getphoto(), builder: (context,AsyncSnapshot<List<Photos>> snapshot){
     return ListView.builder(
         itemCount: phototolist.length,
         itemBuilder: (context,index){
       return ListTile(
         title:Text("Note id id ${phototolist[index].id.toString()}") ,
         subtitle: Text(snapshot.data![index].title.toString()),
         leading: CircleAvatar(
           backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
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
    required this.title, required this.url,required this.id
});



}