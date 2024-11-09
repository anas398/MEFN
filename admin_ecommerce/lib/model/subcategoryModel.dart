import 'dart:convert';

class Subcategorymodel{
  final String id;
  final String categoryId;
  final String categoryName;
  final String image;
  final String subCategoryName;

  Subcategorymodel({required this.id, required this.categoryId, required this.categoryName, required this.image, required this.subCategoryName});


  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "id":id,
      "categoryId":categoryId,
      "categoryName":categoryName,
      "image":image,
      "subCategoryName":subCategoryName,
    };
  }

  String toJson()=>json.encode(toMap());

  factory Subcategorymodel.fromJson(Map<String, dynamic> json) {
    return Subcategorymodel(
      id : json['_id'] as String? ??"",
      categoryId : json['categoryId']as String? ??"",
      image : json['image']as String? ??"",
      categoryName : json['categoryName']as String? ??"",
      subCategoryName : json['subCategoryName']as String? ??"",
    );
  }


}