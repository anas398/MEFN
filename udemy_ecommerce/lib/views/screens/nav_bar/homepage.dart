import 'package:flutter/material.dart';
import 'package:udemy_ecommerce/views/screens/nav_bar/widgets/header_widgets.dart';
import 'package:udemy_ecommerce/widgets/banner_widgets.dart';

import '../../../widgets/categorywidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeaderWidgets(),
          BannerWidgets(),
          CategoryItemWidgets()
        ],
      )
    );
  }
}
