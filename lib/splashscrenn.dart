import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tokoonlinefauzan/allproduct.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({super.key});

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
@override
void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 10),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
     (BuildContext context) => const AllProduct())));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('./lib/assets/Chart.png')),
    );
  }
}