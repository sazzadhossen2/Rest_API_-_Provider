
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteApps extends StatefulWidget {
  const FavouriteApps({super.key});

  @override
  State<FavouriteApps> createState() => _FavouriteAppsState();
}

class _FavouriteAppsState extends State<FavouriteApps> {
  List<int>selecticon=[];
  @override
  Widget build(BuildContext context) {
    print("Byuulid");
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Apps"),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  selecticon.add(index);
                  setState(() {

                  });
                },
                title: Text("item"+index.toString()),
                trailing: Icon( selecticon.contains(index)?Icons.favorite:Icons.favorite_border),
              );
            }),
          ),
        ],
      ),
    );
  }
}

