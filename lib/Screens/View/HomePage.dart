
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modal/Weather_Modal.dart';
import '../Provider/Weather_Provider.dart';


TextEditingController txtsearch = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvidertrue =
    Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderfalse =
    Provider.of<HomeProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(

      body: SingleChildScrollView(
        child: FutureBuilder(
          future: homeProviderfalse.fromMap(homeProvidertrue.search),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModal? weather = snapshot.data;
              return Container(
                height: h,
                width: w,
                decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          weather?.currentModal.is_day == 1 ? Day : Nigth),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 100,
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: TextField(
                              controller: txtsearch,
                              onSubmitted: (value) {
                                homeProviderfalse.Searchweather(txtsearch.text);
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      weather!.locationModal.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      '${weather.currentModal.temp_c.toString()}' + '°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 54),
                    ),
                    Text(
                      '${weather.currentModal.condition.text}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      height: h * 0.50,
                      width: w * 0.90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('24-hour forcast',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              Row(
                                children: [
                                  ...List.generate(
                                      weather.forecastModal.forecastDay.first.hour
                                          .length, (index) {
                                    final hour = weather
                                        .forecastModal.forecastDay.first.hour[index];
                                    return Row(
                                      children: [
                                        Text('${weather.forecastModal.forecastDay.first.hour.first.temp_c}'+'°C'+' ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                        Container(height: 40,width: 40,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(weather.currentModal.condition.icon))),)
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

String Day =
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgiphy.com%2Fexplore%2Ffebruary-weather&psig=AOvVaw2IiVLCP2J6hGLZmwwWOLV5&ust=1722581902093000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCKDvvOSb04cDFQAAAAAdAAAAABAR";
String Nigth =
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2Flightening-moon-gif-lightening-moon-ship-gifs--676243700274513943%2F&psig=AOvVaw04JgiFlGoVvIrOR9cP22Ae&ust=1722582168373000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCJDdkOmc04cDFQAAAAAdAAAAABAR";
int selectedIndex = 0;
