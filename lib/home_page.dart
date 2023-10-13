//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:livetest/model/postmodel.dart';
//
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   List<Postmodel> postlist=[];
//   Future<List<Postmodel>> getPostApi()async{
//     final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//     var data = jsonDecode(response.body.toString());
//     if(response.statusCode ==200){
//       for(Map i in data){
//         postlist.add(Postmodel.fromJson(i));
//       }
//       return postlist;
//     }
//     else{
//       return postlist;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Mu Apps"),),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(future: getPostApi(),
//                 builder:(context,snapshot){
//               if(!snapshot.hasData){
//                 return Text("Loading");
//               }
//               else {
//                 return ListView.builder(
//                     itemCount: postlist.length,
//                     itemBuilder: (context,index){
//                   return Text(index.toString());
//                 });
//               }
//
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livetest/model/postmodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<Postmodel>> getPostApi() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      List<Postmodel> postlist = (jsonDecode(response.body) as List)
          .map((data) => Postmodel.fromJson(data))
          .toList();
      return postlist;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Postmodel>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final postlist = snapshot.data!;
                  return ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(postlist[index].title),
                        subtitle: Text(postlist[index].body),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
