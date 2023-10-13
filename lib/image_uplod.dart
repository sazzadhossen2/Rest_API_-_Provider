
import 'dart:io';
//import 'dart:html';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  File? images;
  final _picker =ImagePicker();
  bool showSpinner =false;
  Future getImage()async{
    final pickedFile =await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    if(pickedFile!=null){
      images=File(pickedFile.path);
      setState(() {

      });
    }
    else{
print("No image");
    }
  }
  
  Future <void>uploadimage()async{
    setState(() {
      showSpinner=true;
    });
    var stream =new http.ByteStream(images!.openRead());
    stream.cast();
    var length =await images!.length();
    var uri =Uri.parse("https://fakestoreapi.com/products");
  }
  @override

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(title: Text("My Apps"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Container(
             child:images==null? Center(child: Text("Pick image"),): Container(
               child: Center(
                 child: Image.file(
                   File(images!.path).absolute,
                   height: 100,
                   width: 100,
                 ),
               ),
             ) ,)
          ],
        ),
      ),
    );
  }
}



