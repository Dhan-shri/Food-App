import 'package:flutter/material.dart';
import 'package:food_recipe/views/home.dart';

  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food recipe",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white)
        )
      ),
      home: const HomePage(),
    );
  }
}
