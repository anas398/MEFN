import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/buyers_screen.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/categories_scteen.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/orders_Screen.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/productscreen.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/subcategoryscreen.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/uploadbaneer_screen.dart';
import 'package:udemy_admin_ecommerce/views/side_bar_screen/vendor_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key}); 

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget selectedscreen = const VendorScreen();
  screenSelector(item){
    switch(item.route){
      case BuyersScreen.id:
        setState(() {
          selectedscreen = const BuyersScreen();
        });
        break;
      case Subcategoryscreen.id:
        setState(() {
          selectedscreen = const Subcategoryscreen();
        });
        break;
      case VendorScreen.id:
        setState(() {
          selectedscreen = const VendorScreen();
        });
        break;
      case UploadbannerScreen.id:
        setState(() {
          selectedscreen = const UploadbannerScreen();
        });

      break;
      case CategoriesScteen.id:
      setState(() {
        selectedscreen = const CategoriesScteen();
      });
      break;
      case OrdersScreen.id:
        setState(() {
          selectedscreen = const OrdersScreen();
        });
        break;
      case ProductScreen.id:
        setState(() {
          selectedscreen = const ProductScreen();
        });
        break;




    }
  }
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text("Management",style: TextStyle(
            color: Colors.white,
            fontSize: 26
          ),),
        ),
        body: selectedscreen,
    sideBar:  SideBar(
      header: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black

        ),
        child: Center(
          child: Text("Multi Vendor Admin",style: TextStyle(
            fontSize: 20,letterSpacing: 1.27,color: Colors.white,
            fontWeight: FontWeight.bold

          ),),
        ),
      ),
        items: const [
          AdminMenuItem(title: "Vendor",route: VendorScreen.id,icon: CupertinoIcons.person_3),
          AdminMenuItem(title: "Buyer",route: BuyersScreen.id,icon: CupertinoIcons.person),
          AdminMenuItem(title: "Orders",route:OrdersScreen.id,icon: Icons.shopping_cart),
          AdminMenuItem(title: "Categories",route: CategoriesScteen.id,icon: Icons.category),
          AdminMenuItem(title: "SubCategories",route: Subcategoryscreen.id,icon: Icons.catching_pokemon_sharp),
          AdminMenuItem(title: "Upload Banner",route: UploadbannerScreen.id,icon: Icons.upload),
          AdminMenuItem(title: "Product",route: ProductScreen.id,icon: Icons.store)
        ],
        selectedRoute: VendorScreen.id,
     onSelected: (item){
       screenSelector(item);
     },
    ),
    );
  }
}
