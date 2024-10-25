import 'package:flutter/material.dart';
import 'package:tokoonlinefauzan/addproduct.dart';
import 'package:tokoonlinefauzan/allproduct.dart';
import 'package:tokoonlinefauzan/homepage.dart';
import 'package:tokoonlinefauzan/productdetail.dart';
import 'package:tokoonlinefauzan/productitems.dart';
import 'package:tokoonlinefauzan/productupdate.dart';
import 'package:tokoonlinefauzan/splashscrenn.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScrenn(),
    );
  }
}