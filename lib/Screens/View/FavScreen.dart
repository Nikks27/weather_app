import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Weather_Provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue =
        Provider.of<WeatherProvider>(context, listen: true);
    WeatherProvider weatherProviderFalse =
        Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Favorite Cities',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 26),
        ),
      ),
      body: ListView.builder(
        itemCount: weatherProviderTrue.wratherList.length,
        itemBuilder: (context, index) => Card(
          color: Color(0xff87A0C9),
          child: ListTile(
            title: Text(
              weatherProviderTrue.wratherList[index].locationModal.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            subtitle: Text(
              weatherProviderTrue.wratherList[index].locationModal.country,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
            leading: Text(
              weatherProviderTrue.wratherList[index].locationModal.region,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
