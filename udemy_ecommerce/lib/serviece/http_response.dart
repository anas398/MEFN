import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
void manageHttpResponse({
  required http.Response response,//Http response from the request
  required BuildContext context, //context is to show Snackbar
  required VoidCallback onSuccess

}){
  switch (response.statusCode){
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, json.decode(response.body)["message"]); //message is named from backend side
      break;
    case 500:
      showSnackBar(context, json.decode(response.body)["error"]); //error is named from backend side
      break;
    case 201:
      onSuccess();
      break;

  }
}
void showSnackBar(BuildContext context,String title){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}