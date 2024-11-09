import 'dart:convert';

import 'package:http/http.dart'as http;

import '../global_variable.dart';
import '../model/bannerModel.dart';
class Bannercontroller{


  ///fetchBanner
  Future<List<Bannermodel>>fetchbanner()async{
    try{
      http.Response response = await http.get(Uri.parse("${uri}/api/getbanners" ),
          headers: <String,String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      if(response.statusCode==200){
        List<dynamic>data= jsonDecode(response.body);
        print("DATAS>>>>>> ${data}");
        List<Bannermodel>banners = data.map((banner)=>Bannermodel.fromMap(banner)).toList();
        print("banners>>>>>> ${banners}");
        return banners;

      }else{
        //thorw exception if the server responsed with an error code
        throw Exception("Failed Load Banner");
      }

    }catch(e){
      throw Exception(e.toString());
      print("Catheced error>>>>>>>>>>>>>   ${e.toString()}");
    }

  }


}