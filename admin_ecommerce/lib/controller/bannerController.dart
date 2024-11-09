import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_admin_ecommerce/global_varaiable.dart';
import 'package:udemy_admin_ecommerce/model/bannerModel.dart';
import 'package:udemy_admin_ecommerce/model/categories.dart';
import 'package:http/http.dart'as http;
import 'package:udemy_admin_ecommerce/servieces/manage_http_servieces.dart';
class Bannercontroller{

  uploadBanner({required dynamic pickedImage,required context})async{
    try{
      final cloudinary = CloudinaryPublic("dubn7eyg4", "vfcp6jos");
      //upload image
      CloudinaryResponse imageresponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedImage, identifier: "pickedImage",
            folder: "bannerImage"),
      );
      String image = imageresponse.secureUrl ; //EXACT IMAGE URL

      Bannermodel bannermodel = Bannermodel(
          id: "",
          image: image,
          );
      http.Response response =  await http.post(Uri.parse("${uri}/api/banner"),
          body: bannermodel.toJson(),
          headers: <String,String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: (){
            showSnackBar(context, "Banner Uploaded");
          });



    }catch(e){
      print("Error Uploading to cloudinary: ${e.toString()}");

    }
  }

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