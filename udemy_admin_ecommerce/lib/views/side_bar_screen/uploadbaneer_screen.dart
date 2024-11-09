import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:udemy_admin_ecommerce/controller/bannerController.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/widgets/banner_Widgets.dart';

class UploadbannerScreen extends StatefulWidget {
  static const String id = '\bannerscreen';
  const UploadbannerScreen({super.key});

  @override
  State<UploadbannerScreen> createState() => _UploadbannerScreenState();
}

class _UploadbannerScreenState extends State<UploadbannerScreen> {
  dynamic _bannerImage;
  Bannercontroller bannercontroller =Bannercontroller();


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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: const Text("Banner",style: TextStyle(
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
              child:  Center(child:_bannerImage!=null?
              Image.memory(_bannerImage,fit: BoxFit.fill,):
              Text("Banner Image")),
            ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink
                  ),
                  onPressed: ()async{
                    await bannercontroller.uploadBanner(pickedImage: _bannerImage, context: context);
                  }, child: const Text("Save",
                style: TextStyle(color: Colors.white),)),
           )

          ],
        ),



        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: pickBannerImage,

              child: Text("Pick Image")),
        ),
        Divider(
          color: Colors.grey,
        ),
        BannerWidgets()
      ],
    );
  }
}
