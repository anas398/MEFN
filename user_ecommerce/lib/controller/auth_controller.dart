import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_ecommerce/model/userModel.dart';
import 'package:http/http.dart'as http;
import 'package:udemy_ecommerce/global_variable.dart';
import 'package:udemy_ecommerce/serviece/http_response.dart';
import 'package:udemy_ecommerce/views/screens/mainpage.dart';
class AuthController{
  Future<void> signUpUsers({
    required BuildContext context,
    required String email,
    required String address,
    required String name,
    required String password
})async{
    try{
     Usermodel usermodel =  Usermodel(name: name, id: "", email: email, address: address, password: password, token: '');
     print("API >>>>>>>>>>>  '${uri}/api/signup");
     http.Response response= await http.post(
         Uri.parse('${uri}/api/signup'),
     body: usermodel.toJson(), //Convert user object to JSon for the request bodyh
     headers: <String,String>
        {
       'Content-Type': 'application/json; charset=UTF-8',


         }
     );
     print("RESPONSE >>>>  ${response.body}");
     manageHttpResponse(response: response, context: context, onSuccess: (){
       showSnackBar(context, "Account has been created Succefully");
     });

    }catch(e){
      showSnackBar(context, e.toString());
      
    }
  }


  Future<void> signInUsers({
    required BuildContext context,
    required String email,
    required String password
  })async{
    try{
     // Usermodel usermodel =  Usermodel(name: name, id: "", email: email, address: address, password: password);

      print("API >>>>>>>>>>>  '${uri}/api/signin");
      http.Response response= await http.post(
          Uri.parse('${uri}/api/signin'),
          body: jsonEncode({
            "email":email,
            "password":password
          }), //Convert user object to JSon for the request bodyh
          headers: <String,String>
          {
            'Content-Type': 'application/json; charset=UTF-8',


          }
      );
      print("RESPONSE >>>>  ${response.body}");
      manageHttpResponse(response: response, context: context, onSuccess: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainPage()),(route) => false,);
        showSnackBar(context, "Logged In");
      });

    }catch(e){
      showSnackBar(context, e.toString());

    }
  }

}