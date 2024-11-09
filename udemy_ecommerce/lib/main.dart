import 'package:flutter/material.dart';
import 'package:udemy_ecommerce/views/screens/mainpage.dart';
import 'package:udemy_ecommerce/views/screens/login_screen.dart';
import 'package:udemy_ecommerce/views/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udemy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MainPage(),
    );
  }
}

