import 'package:flutter/material.dart';
import 'package:udemy_ecommerce/widgets/reusable_widgets.dart';

import '../controller/categoryController.dart';
import '../model/categoryModel.dart';

class CategoryItemWidgets extends StatefulWidget {
  const CategoryItemWidgets({super.key});

  @override
  State<CategoryItemWidgets> createState() => _CategoryItemWidgetsState();
}

class _CategoryItemWidgetsState extends State<CategoryItemWidgets> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ReusableWidgets(title: "Categories", subTitle: "View all"),
        FutureBuilder(
            future: futureCategory,
            builder: (context,snapshot){
              if(snapshot.connectionState ==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);

              }else if(snapshot.hasError){
                return Center(child: Text("Error : ${snapshot.error}"),);
              }else if(!snapshot.hasData || snapshot.data!.isEmpty){
                return const Center(child: Text("No Category found"),);
              }else{
                final categories = snapshot.data!;
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories!.length,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                     // mainAxisSpacing: 5,

                    ),
                    itemBuilder: (context,index){
                      final category = categories[index];
                      return Column(
                        children: [
                          Image.network(category.image,width:60,
                            height: 60,fit: BoxFit.fill,),
                          Text(category.name)
                        ],
                      );
                    });
              }


            }),
      ],
    );
  }
}
