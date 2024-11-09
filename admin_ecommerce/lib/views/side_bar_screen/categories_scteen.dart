import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:udemy_admin_ecommerce/controller/category_controller.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/widgets/category_widgets.dart';

class CategoriesScteen extends StatefulWidget {
  static const String id = '\categoryscreen';
  const CategoriesScteen({super.key});

  @override
  State<CategoriesScteen> createState() => _CategoriesScteenState();
}

class _CategoriesScteenState extends State<CategoriesScteen> {
  dynamic _image;
  dynamic _bannerImage;
  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();
TextEditingController txtcatname= TextEditingController();
 CategoryController _categoryController =CategoryController();
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
  pickBannerImage()async{
    FilePickerResult ? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if(result != null){
      setState(() {
        _bannerImage =result.files.first.bytes;
      });
    }
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
              child: const Text("Categories",style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),),
            ),

            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Divider(color: Colors.grey,),
            ),
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
                  const Text("Category Image")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,

                    child: TextFormField(
                      controller: txtcatname,
                      validator: (value){
                        if(value!.isNotEmpty){
                          return null;
                        }else{
                          return 'Plaese enter category name';

                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Enter category name'
                      ),
                    ),
                  ),
                ),
              TextButton(onPressed: (){}, child: const Text("Cancel")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink
                  ),
                  onPressed: (){
                    if(_formkey.currentState!.validate()){

                      _categoryController.uploadCategory(pickedImage: _image, pickedBanner: _bannerImage,
                      name: txtcatname.text.trim(),context: context);


                    }
                  }, child: const Text("Save",
              style: TextStyle(color: Colors.white),))

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: pickImage, child: const Text("Pick image")),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Divider(color: Colors.grey,),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey,

                  borderRadius: BorderRadius.circular(10)

              ),
              child:  Center(child:_bannerImage!=null?
              Image.memory(_bannerImage,fit: BoxFit.fill,):
              const Text("Banner Image")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: pickBannerImage,

                  child: const Text("Pick Image")),
            ),
            const Divider(
              color: Colors.grey,
            ),

            const CategoryWidgets()
          ],
        ),
      ),
    );
  }
}
