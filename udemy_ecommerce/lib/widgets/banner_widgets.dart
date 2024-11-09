import 'package:flutter/material.dart';

import '../controller/banner_controller.dart';
import '../model/bannerModel.dart';

class BannerWidgets extends StatefulWidget {
  const BannerWidgets({super.key});

  @override
  State<BannerWidgets> createState() => _BannerWidgetsState();
}

class _BannerWidgetsState extends State<BannerWidgets> {

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
    Size size =MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:  width,
        height: 200,
        decoration: BoxDecoration(
        //  color: Colors.red,
         color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(5)
        ),
        child: FutureBuilder(
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
                return PageView.builder(
                    itemCount: banners!.length,

                    itemBuilder: (context,index){
                      final banner = banners[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.network(
                          banner.image,
                        fit: BoxFit.fill,),
                      );
                    });
              }
            }),

      ),
    );
  }
}
