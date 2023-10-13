//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:livetest/provider/provider.dart';
// import 'package:provider/provider.dart';
//
// class Screen extends StatefulWidget {
//   const Screen({super.key});
//
//   @override
//   State<Screen> createState() => _ScreenState();
// }
//
// class _ScreenState extends State<Screen> {
//   @override
//   Widget build(BuildContext context) {
//     final countprovider= Provider.of<Countprovider>(context,listen: false);
//     print("Buyild");
//     return Scaffold(
//
//       appBar: AppBar(title: Text("Count apps"),),
//       body: Center(
//           child:Consumer<Countprovider>(builder: (context,value,child){
//             return           Text(value.count.toString(),
//               style: TextStyle(
//                   fontWeight:FontWeight.bold,
//                   fontSize: 30),);
//
//           })
//
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//     countprovider.setcount();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
