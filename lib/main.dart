import 'package:flutter/material.dart';
import 'package:in_top/home_page.dart';
import 'package:in_top/provider1.dart';
import 'package:provider/provider.dart';

import 'Internet.dart';
import 'details.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context) => watchListProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: internetChechker(),
    ));
  }
}


