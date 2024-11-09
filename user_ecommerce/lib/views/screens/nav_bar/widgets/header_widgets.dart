import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Container(
      width: width,
      height: height *0.20,
      child: Stack(
        children: [
          Image.asset("assets/header.jpg", width: width,fit: BoxFit.fill,),
          Positioned(
              left: 50,

              top:66 ,
              child: SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Text',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,vertical: 16
                      ),
                      prefixIcon: Icon(Icons.search,size: 32,color: Colors.black,),
                      suffixIcon: Icon(Icons.camera_alt,size: 32,color: Colors.black,),
                       fillColor: Colors.grey.shade400,
                       focusColor: Colors.black,
                        border: InputBorder.none,
                      filled: true
                    ),

                  ))),
          Positioned(
            left: 310,
              top: 75,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: (){},
                  overlayColor:
               //   WidgetStateProperty.all(Color(0x0c7f7f)),
                  WidgetStateProperty.all(Colors.transparent),
                  child: Ink(
                    height: 32,
                      width: 32,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: 
                      AssetImage("assets/bell.png"))
                      
                    ),
                  ),
                ),

              )),
          Positioned(
              right: 15,
              top: 75,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: (){},
                  overlayColor:
                  //   WidgetStateProperty.all(Color(0x0c7f7f)),
                  WidgetStateProperty.all(Colors.blue.shade100),
                  child: Ink(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image:
                        AssetImage("assets/message.png"))

                    ),
                  ),
                ),

              )),
        ],
      ),
    );
  }
}
