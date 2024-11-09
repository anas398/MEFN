import 'package:flutter/material.dart';
import 'package:udemy_admin_ecommerce/controller/category_controller.dart';
import 'package:udemy_admin_ecommerce/model/categories.dart';

class CategoryWidgets extends StatefulWidget {
  const CategoryWidgets({super.key});

  @override
  State<CategoryWidgets> createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets> {
  ///A future that will hold the list of category once loaded from the api
  late Future<List<CategoryModel>>futureCategory;
  CategoryController categoryController =CategoryController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategory = categoryController.fetchCategory();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCategory,
        builder: (context,snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return const Center(child: SizedBox(
                height: 40,width: 40,
                child: CircularProgressIndicator()),);

          }else if(snapshot.hasError){
            return Center(child: Text("Error : ${snapshot.error}"),);
          }else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(child: Text("No Category found"),);
          }else{
            final categories = snapshot.data!;
            return GridView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,

                ),
                itemBuilder: (context,index){
                  final category = categories[index];
                  return Column(
                    children: [
                      Image.network(category.image,width:100,
                        height: 100,),
                      Text(category.name)
                    ],
                  );
                });
          }


        });
  }
}
