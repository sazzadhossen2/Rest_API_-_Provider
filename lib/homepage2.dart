
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/modelpostman.dart';
import 'package:http/http.dart' as http;

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  Future<Modelpostman>getapi()async{
    final responce =await http.get(Uri.parse("https://webhook.site/a2db6042-17f7-4eac-8bb0-a8c38d50f77b"));
 var data=jsonDecode(responce.body.toString());
    if(responce.statusCode==200){
   return Modelpostman.fromJson(data);
 }else{
   return Modelpostman.fromJson(data);
 }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Calling"),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Modelpostman>(
                future: getapi(),
                builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount:snapshot.data!.data!.length,
                    itemBuilder: (context,index){
                  return Text(index.toString());
                });
              }
              else{
                return Text("Loading");
              }


                }),
          )
        ],
      ),
    );
  }
}

//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'model/modelpostman.dart';
// import 'package:http/http.dart' as http;
//
// class Homepage2 extends StatefulWidget {
//   const Homepage2({Key? key}) : super(key: key);
//
//   @override
//   State<Homepage2> createState() => _Homepage2State();
// }
//
// class _Homepage2State extends State<Homepage2> {
//   Future<Modelpostman?> getapi() async {
//     final response = await http.get(Uri.parse("https://webhook.site/a2db6042-17f7-4eac-8bb0-a8c38d50f77b"));
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       return Modelpostman.fromJson(data);
//     } else {
//       return null; // Handle the error case accordingly
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Api Calling")),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<Modelpostman?>(
//               future: getapi(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Text("Error: ${snapshot.error}");
//                 } else if (snapshot.hasData) {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.data!.length,
//                     itemBuilder: (context, index) {
//                       return Text(index.toString());
//                     },
//                   );
//                 } else {
//                   return Text("No data available");
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
