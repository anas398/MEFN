import 'package:flutter/material.dart';
import 'package:udemy_admin_ecommerce/controller/category_controller.dart';
import 'package:udemy_admin_ecommerce/controller/subCategoryController.dart';
import 'package:udemy_admin_ecommerce/model/categories.dart';
import 'package:udemy_admin_ecommerce/model/subcategoryModel.dart';

class SubCategoryWidgets extends StatefulWidget {
  const SubCategoryWidgets({super.key});

  @override
  State<SubCategoryWidgets> createState() => _SubCategoryWidgetsState();
}

class _SubCategoryWidgetsState extends State<SubCategoryWidgets> {
  ///A future that will hold the list of category once loaded from the api
  late Future<List<Subcategorymodel>>futureSubCategory;
  SubCategoryController subCategoryController =SubCategoryController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSubCategory = subCategoryController.fetchSubCategory();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureSubCategory,
        builder: (context,snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);

          }else if(snapshot.hasError){
            return Center(child: Text("Error : ${snapshot.error}"),);
          }else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(child: Text("No SubCategory found"),);
          }else{
            final subCategories = snapshot.data!;
            return GridView.builder(
                itemCount: subCategories.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,

                ),
                itemBuilder: (context,index){
                  final subCategory = subCategories[index];
                  return Column(
                    children: [
                      Image.network(subCategory.image,width:100,
                        height: 100,),
                      Text(subCategory.subCategoryName)
                    ],
                  );
                });
          }


        });
  }
}
