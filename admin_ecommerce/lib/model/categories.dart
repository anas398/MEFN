import 'dart:convert';

class CategoryModel {
 final String sId;
 final String name;
 final String image;
 final String banner;

  CategoryModel({required this.sId, required this.name, required this.image, required this.banner});

 Map<String,dynamic> toMap(){
   return <String,dynamic>{
     "id":sId,
     "name":name,
     "image":image,
     "banner":banner,


   };
 }

 String toJson()=>json.encode(toMap());

 factory CategoryModel.fromMap(Map<String, dynamic> json) {
   return CategoryModel(
       sId : json['_id'] as String? ??"",
       name : json['name']as String? ??"",
       image : json['image']as String? ??"",
       banner : json['banner']as String? ??"",
   );
  }

 factory CategoryModel.fromJson(String source)=>
     CategoryModel.fromMap(jsonDecode(source)as Map<String,dynamic>);


}