
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/provider/favourite.dart';
import 'package:provider/provider.dart';

class Foviderscreen extends StatefulWidget {
  const Foviderscreen({super.key});

  @override
  State<Foviderscreen> createState() => _FoviderscreenState();
}

class _FoviderscreenState extends State<Foviderscreen> {
  @override
  Widget build(BuildContext context) {
    //final favoriteitem =Provider.of<Fovider>(context,listen: false);
    print("Object");
    return Scaffold(
      appBar: AppBar(title: Text("favprite Apps"),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
             return Consumer<Fovider>(builder: (context,value,child){
               return ListTile(
                 onTap: (){
                   if(value.favorite.contains(index)){
                     value.remove(index);
                   }else{
                   value.setState(index);
                   }
                 },
                 title: Text("item"+index.toString()),
                 trailing: Icon( value.favorite.contains(index)?Icons.favorite:Icons.favorite_border),
               );
             });
            }),
          )
        ],
      ),
    );
  }
}
