import 'dart:convert';

class Usermodel {
  //Define Field
  final String id;
  final String email;
  final String name;
  final String address;
  final String password;
  final String token;
  Usermodel( {required this.token ,required this.name,required this.id,required this.email,required this.address,required this.password});

/// Serialization : convert User object to a Map
///Why Map: Converting to map is an intermediate step that make it easy ti serialize
///these object to formates likes json for storage or transmission


Map<String,dynamic> toMap(){
  return <String,dynamic>{
    "id":id,
    "name":name,
    "email":email,
    "password":password,
    "address":address,
    "token":token,

  };
}

///Serialization : convert Map to a json String
///This method directly encodes the data from map in to json string

///the json.encode() function convert a dart object(such as map or list)
String toJson()=>json.encode(toMap());

///Deserialization : Convert a Map to a User Object
///purpose:manipulation and user : Once the data is converted to User Objects
///it can easyly manipualte and use within application
///fromMaP: THIS CONSTRACTOR TAKE map<String,dynamic> and converts into User Object
factory Usermodel.fromMap(Map<String,dynamic> map){
  return Usermodel(
      name: map['name'] as String? ??"",
      id: map['_id'] as String? ??"",
      email: map['email'] as String? ??"",
      address: map['address'] as String? ??"",
      password: map['password'] as String? ??"",
      token: map['token'] as String? ??"", );
}

factory Usermodel.fromJson(String source)=>
    Usermodel.fromMap(jsonDecode(source)as Map<String,dynamic>);


}