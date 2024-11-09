import 'dart:js_interop';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:udemy_admin_ecommerce/controller/category_controller.dart';
import 'package:udemy_admin_ecommerce/model/categories.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/widgets/subCategoryWidgets.dart';

import '../../controller/subCategoryController.dart';

class Subcategoryscreen extends StatefulWidget {
  static const String id = '\subCategorys';
  const Subcategoryscreen({super.key});

  @override
  State<Subcategoryscreen> createState() => _SubcategoryscreenState();
}

class _SubcategoryscreenState extends State<Subcategoryscreen> {
  dynamic _image;

  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();
  TextEditingController txtSubCatName= TextEditingController();
  pickImage()async{
    FilePickerResult ? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if(result != null){
      setState(() {
        _image =result.files.first.bytes;
      });
    }
  }
  SubCategoryController _subCategoryController =SubCategoryController();
  CategoryController _categoryController =CategoryController();
  CategoryModel ? selectCategory;

  late Future<List<CategoryModel>> futureCategory;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategory = _categoryController.fetchCategory() as Future<List<CategoryModel>>;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text("Sub Categories",style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold
              ),),
            ),

             Padding(
              padding: EdgeInsets.all(5.0),
              child: Divider(color: Colors.grey,),
            ),


            FutureBuilder(
                future: futureCategory,
                builder: (context,snapshot){
   if(snapshot.connectionState ==ConnectionState.waiting){
     return Center(child: CircularProgressIndicator(),);
   }
   else if(snapshot.hasError){
     return Center(child: Text("Error:: ${snapshot.error}"),);

   }
   else if(!snapshot.hasData ||snapshot.data!.isEmpty){
     return Center(
       child: Text("No Sub Category"),
     );
   }
   else{
     return DropdownButton<CategoryModel>(
         hint:Text("Select Category") ,
         value: selectCategory,
         items: snapshot.data?.map((CategoryModel e){
           return DropdownMenuItem(
               value: e,
               child: Text("${e.name}"));
         }).toList(),
         onChanged: (val){
           setState(() {
             selectCategory = val;
           });
           print("selectCategory>> ${selectCategory!.name}");
         });


   }

                }),

            Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey,

                      borderRadius: BorderRadius.circular(10)

                  ),
                  child:  Center(child:_image!=null?
                  Image.memory(_image,fit: BoxFit.fill,):
                  const Text("SubCategory Image")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,

                    child: TextFormField(
                      controller: txtSubCatName,
                      validator: (value){
                        if(value!.isNotEmpty){
                          return null;
                        }else{
                          return 'Please enter SubCategory name';

                        }
                      },
                      decoration: const InputDecoration(
                          labelText: 'Enter SubCategory name'
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink
                    ),
                    onPressed: ()async{
                      if(_formkey.currentState!.validate()){
                        await  _subCategoryController.uploadSubCategory(
                              pickedImage: _image,
                              categoryId: selectCategory!.sId,
                              categoryName: selectCategory!.name,
                              subCategoryName: txtSubCatName.text,
                              context: context);
                        setState(() {
                          _formkey.currentState!.reset();
                          _image=null;
                        });
                        // _categoryController.uploadCategory(pickedImage: _image,,
                        //     name: txtcatname.text.trim(),context: context);


                      }
                    }, child: const Text("Save",
                  style: TextStyle(color: Colors.white),))

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: pickImage, child: const Text("Pick image")),
            ),
            Divider(
              color: Colors.grey,
            ),
            SubCategoryWidgets()









            // const CategoryWidgets()
          ],
        ),
      ),
    );
  }
}
