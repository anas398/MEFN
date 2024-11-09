import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_admin_ecommerce/global_varaiable.dart';
import 'package:udemy_admin_ecommerce/model/categories.dart';
import 'package:http/http.dart'as http;
import 'package:udemy_admin_ecommerce/model/subcategoryModel.dart';
import 'package:udemy_admin_ecommerce/servieces/manage_http_servieces.dart';
class SubCategoryController{
  uploadSubCategory({required dynamic pickedImage,required String categoryId,
    required String categoryName ,required String subCategoryName,required context})async{
    try{
      final cloudinary = CloudinaryPublic("dubn7eyg4", "vfcp6jos");
      //upload image
      CloudinaryResponse imageresponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedImage, identifier: "pickedImage",
            folder: "subCategoryImage"),
      );
      String image = imageresponse.secureUrl ; //EXACT IMAGE URL
      print(imageresponse);
      Subcategorymodel subcategorymodel = Subcategorymodel(
          id: "",
          categoryId: categoryId,
          categoryName: categoryName,
          image: image,
          subCategoryName: subCategoryName);
      http.Response response =  await http.post(Uri.parse("${uri}/api/subCategories"),
          body: subcategorymodel.toJson(),
          headers: <String,String>{
            'Content-Type': 'application/json; charset=UTF-8',

          });
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: (){
            showSnackBar(context, "Uploaded SubCategory");
          });



    }catch(e){
      print("Error Uploading to cloudinary: ${e.toString()}");

    }
  }


  ///fetch category
  Future<List<Subcategorymodel>> fetchSubCategory()async{
    try{
      http.Response response = await http.get(Uri.parse("${uri}/api/getSubCategory" ),
          headers: <String,String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      if(response.statusCode==200){
        List<dynamic>data= jsonDecode(response.body);
        print("DATAS>>>>>> ${data}");
        List<Subcategorymodel>subCategoris = data.map((subcat)=>Subcategorymodel.fromJson(subcat)).toList();
        print("categoris>>>>>> ${subCategoris}");
        return subCategoris;

      }else{
        //thorw exception if the server responsed with an error code
        throw Exception("Failed Load SubCategory");
      }

    }catch(e){
      throw Exception(e.toString());
      print("Catheced error>>>>>>>>>>>>>   ${e.toString()}");
    }
  }
}