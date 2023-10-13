
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetest/provider/provider2.dart';
import 'package:provider/provider.dart';

class Multipolproviders extends StatefulWidget {
  const Multipolproviders({super.key});

  @override
  State<Multipolproviders> createState() => _MultipolprovidersState();
}
class _MultipolprovidersState extends State<Multipolproviders> {
  @override
  Widget build(BuildContext context) {
  //  final multiprovider =Provider.of<MultipolProvider>(context,listen: false);
    print("obj");
    return Scaffold(
      appBar: AppBar(title: Text("Multipol Provider"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Consumer<MultipolProvider>(builder: (context,value,child){
              return Slider(
                  max: 1.0,
                  min: 0.0,
                  value:value.value , onChanged: (val){
                value.setState(val);
              });
            }),
          ),
          Expanded(
            child: Consumer<MultipolProvider>(builder: (context,value,child){
              return Row(
                children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.withOpacity(value.value),
                    ),
                  ),
                ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.withOpacity(value.value),
                      ),
                    ),
                  )
                ],
              );
            }),
          )
        ],

      ),
    );
  }
}

