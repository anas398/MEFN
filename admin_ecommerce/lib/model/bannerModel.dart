import 'dart:convert';

class Bannermodel
{
  final String id;
  final String image;
  Bannermodel({required this.id,required this.image});


  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "id":id,
      "image":image,
     };
  }

  String toJson()=>json.encode(toMap());

  factory Bannermodel.fromMap(Map<String, dynamic> json) {
    return Bannermodel(
      id : json['_id'] as String? ??"",
      image : json['image']as String? ??"",
    );
  }
  //
  // factory Bannermodel.fromJson(String source)=>
  //     Bannermodel.fromMap(jsonDecode(source)as Map<String,dynamic>);


}