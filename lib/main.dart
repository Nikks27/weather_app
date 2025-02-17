import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Provider/Weather_Provider.dart';
import 'Screens/View/FavScreen.dart';
import 'Screens/View/HomePage.dart';
import 'Screens/View/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // '/' : (context) =>  SplashScreen(),
          '/' : (context) =>  SplashScreen(),
          '/home' : (context) =>  HomePage(),
          '/fav' : (context) =>  FavScreen(),
          // '/' : (context) =>  FavScreen(),
        },
      ),
    );
  }
}
