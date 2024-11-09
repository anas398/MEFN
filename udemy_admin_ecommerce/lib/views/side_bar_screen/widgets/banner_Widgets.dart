import 'package:flutter/material.dart';
import 'package:udemy_admin_ecommerce/controller/bannerController.dart';
import 'package:udemy_admin_ecommerce/model/bannerModel.dart';

class BannerWidgets extends StatefulWidget {
  const BannerWidgets({super.key});

  @override
  State<BannerWidgets> createState() => _BannerWidgetsState();
}

class _BannerWidgetsState extends State<BannerWidgets> {
  ///A future that will hold the list of banner once loaded from the api
  late Future<List<Bannermodel>>futurebanners;
  Bannercontroller bannercontroller =Bannercontroller();
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    futurebanners = bannercontroller.fetchbanner();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futurebanners,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();

          }else if(snapshot.hasError){
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );

          }else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return const Center(
              child: Text("No Banners..."),
            );
          }else{
            final banners = snapshot.data;
            return GridView.builder(
              itemCount: banners!.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,

                ),
                itemBuilder: (context,index){
                final banner = banners[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(banner.image,width:100,
                      height: 100,),
                );
                });
          }
        });
  }
}
