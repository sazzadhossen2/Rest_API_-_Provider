// import 'dart:convert';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:http/http.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import '../model2/postslist.dart';
// class Postlist extends StatefulWidget {
//   const Postlist({super.key});
//   @override
//   State<Postlist> createState() => _PostlistState();
// }
// class _PostlistState extends State<Postlist> {
// File?image;
// final _picker =ImagePicker();
// bool showSpinner = false;
//
// Future getImage()async{
//   final pickerfile =await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
//   if(pickerfile!=null){
//     image=File(pickerfile.path);
//     setState(() {
//
//     });
//   }else{
//     print('no image selected');
//   }
// }
//
// Future<void>uplodImage()async{
//   setState(() {
//     showSpinner=true;
//   });
//   var stream =new http.ByteStream(image!.openRead());
//   stream.cast();
//   var length =await image!.length();
//   var uri =Uri.parse("https://fakestoreapi.com/products");
//   var request = new http.MultipartRequest("POST", uri);
//   request.fields["title"]= "Static title";
//   var multiport =new http.MultipartFile(
//       "image",
//       stream,
//       length
//   );
//   request.files.add(multiport);
//   var response=await request.send();
//   if(response.statusCode==200){
//
//     setState(() {
//       showSpinner=true;
//     });
//    print("Uplod image");
//   }
//   else{
//     setState(() {
//       showSpinner=true;
//     });
//     print("uplod failed");
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Center(child: Text("Post List")),),
//   body: ModalProgressHUD(
//     inAsyncCall:showSpinner,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
// GestureDetector(
//   onTap: (){
//     getImage();
//   },
//   child:   Container(
//       child: image==null? Center(child: Text("Pick Image")):Container(
//         child: Image.file(File(image!.path).absolute,
//           height: 100,
//           width: 100,
//           fit: BoxFit.cover,
//         ),
//       ),
//
//   ),
// ),
//         SizedBox(height: 150,),
//         GestureDetector(
//           onTap: (){
// uplodImage();
//           },
//           child: Container(
//             height: 50,
//             width: 200,
//             color: Colors.green,
//             child: Center(child: Text("XYz")),),
//         )
//       ],
//     ),
//   ),
//     );
//   }
// }
//
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Postlist extends StatefulWidget {
  const Postlist({Key? key}) : super(key: key);

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickerFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickerFile != null) {
      image = File(pickerFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    if (image == null) {
      setState(() {
        showSpinner = false;
      });
      return; // No image to upload.
    }

    var uri = Uri.parse("https://fakestoreapi.com/products");
    var request = http.MultipartRequest("POST", uri);
    request.fields["title"] = "Static title";
    var multiPart = await http.MultipartFile.fromPath("image", image!.path);
    request.files.add(multiPart);

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        setState(() {
          showSpinner = false;
        });
        print("Upload image successful");
      } else {
        setState(() {
          showSpinner = false;
        });
        print("Upload failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        showSpinner = false;
      });
      print("Error during upload: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Post List")),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? Center(child: Text("Pick Image"))
                    : Container(
                  child: Image.file(
                    File(image!.path).absolute,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: Center(child: Text("Upload")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
