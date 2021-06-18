import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget  build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,

      ),
      routes: {
        "/":(context)=>HomePage(),
        "/result":(context)=>ResultScreen(),
      },

    );
  }
}