
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Themeprovider with ChangeNotifier{
  bool _loading =false;
  bool get loading =>_loading;

void setLoading(bool value){
  _loading = value;
  notifyListeners();
}

void Loagin(String email, String password) async{
  setLoading(true);
  try{

    final response=await post(Uri.parse("https://reqres.in/api/login"),
    body: {
      "email":email,
        "password":password
        }
    );
    if(response.statusCode==200){
      print("Successfull");
      setLoading(false);
    }else{
      print("failed");
      setLoading(false);
    }

  }catch(e){
    print(e.toString());
    setLoading(false);
  }

}


}