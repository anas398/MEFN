import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_admin_ecommerce/global_varaiable.dart';
import 'package:udemy_admin_ecommerce/model/categories.dart';
import 'package:http/http.dart'as http;
import 'package:udemy_admin_ecommerce/servieces/manage_http_servieces.dart';
class CategoryController{
  uploadCategory({required dynamic pickedImage,required dynamic pickedBanner,
  required name,required context})async{
    try{
      final cloudinary = CloudinaryPublic("dubn7eyg4", "vfcp6jos");
      //upload image
      CloudinaryResponse imageresponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedImage, identifier: "pickedImage",
        folder: "categoryImage"),
      );
      String image = imageresponse.secureUrl ; //EXACT IMAGE URL
      print(imageresponse);

      CloudinaryResponse bannerresponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedBanner, identifier: "pickedBanner",
            folder: "categoryImage"),
      );
      String banner_image = bannerresponse.secureUrl ; //EXACT IMAGE URL
      print(imageresponse);

      CategoryModel categoryModel = CategoryModel(
          sId: "",
          name: name,
          image: image,
          banner: banner_image);
    http.Response response =  await http.post(Uri.parse("${uri}/api/categories"),
        body: categoryModel.toJson(),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',

        });
    manageHttpResponse(
        response: response,
        context: context,
        onSuccess: (){
          showSnackBar(context, "Uploaded Category");
    });



    }catch(e){
      print("Error Uploading to cloudinary: ${e.toString()}");

    }
  }


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