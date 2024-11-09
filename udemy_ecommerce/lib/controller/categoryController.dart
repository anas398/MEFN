import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;

import '../global_variable.dart';
import '../model/categoryModel.dart';
class CategoryController{

  ///fetch category
  Future<List<CategoryModel>> fetchCategory()async{
    try{
      http.Response response = await http.get(Uri.parse("${uri}/api/getCategories" ),
          headers: <String,String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      if(response.statusCode==200){
        List<dynamic>data= jsonDecode(response.body);
        print("DATAS>>>>>> ${data}");
        List<CategoryModel>categoris = data.map((category)=>CategoryModel.fromMap(category)).toList();
        print("categoris>>>>>> ${categoris}");
        return categoris;

      }else{
        //thorw exception if the server responsed with an error code
        throw Exception("Failed Load Category");
      }

    }catch(e){
      throw Exception(e.toString());
      print("Catheced error>>>>>>>>>>>>>   ${e.toString()}");
    }
  }
}