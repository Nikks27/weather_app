import 'dart:async';
import 'package:flutter/material.dart';
import 'HomePage.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => HomePage(),),);
    } );
    return Scaffold(
      body:Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'Assets/images/weather logo 2.png'
              )
            )
          ),
        ),
      )
    );
  }
}