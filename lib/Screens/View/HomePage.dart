import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Screens/View/FavScreen.dart';
import '../Modal/Weather_Modal.dart';
import '../Provider/Weather_Provider.dart';


TextEditingController txtSearch = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of<WeatherProvider>(context);
    WeatherProvider weatherProviderFalse =
    Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: weatherProviderFalse.fromMap(weatherProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherModal? weather = snapshot.data;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      (weatherProviderTrue.weatherModal!.currentModal.is_day ==
                          1)
                          ? Day
                          : Nigth),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 34,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: txtSearch,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintText: 'Search City Weather',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                weatherProviderFalse.searchCity(txtSearch.text);
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                            weatherProviderTrue.weatherModal!.locationModal.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '${weatherProviderTrue.weatherModal!.currentModal.temp_c}°',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 90),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 48.0),
                            child: Text(
                              'C',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${weatherProviderTrue.weatherModal!.currentModal.condition.text}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        height: 178,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' 24 - Hour Forecast',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    weatherProviderTrue
                                        .weatherModal!
                                        .forcatModal
                                        .forcastday
                                        .first
                                        .hour
                                        .length,
                                        (index) {
                                      final hour = weatherProviderTrue
                                          .weatherModal!
                                          .forcatModal
                                          .forcastday
                                          .first
                                          .hour[index];
                                      return Container(
                                        height: 120,
                                        width: 80,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${hour.time.split(" ").sublist(1, 2).join(" ")}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            Image.network(
                                                'https:${hour.hourConditionModal.icon}'),
                                            Text(
                                              '${hour.temp_c}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${weatherProviderTrue.weatherModal!.currentModal.wind_mph} mp/h',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Text(
                                        '${weatherProviderTrue.weatherModal!.currentModal.wind_kph}kp/h',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  height: 70,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${weatherProviderTrue.weatherModal!.forcatModal.forcastday[0].astro.sunrise} sunrise',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                      Text(
                                        '${weatherProviderTrue.weatherModal!.forcatModal.forcastday[0].astro.sunset} sunset',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 184,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Humidity',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                                '${weatherProviderTrue.weatherModal!.currentModal.humidity}%',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          height: 0.2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'UV',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                                '${weatherProviderTrue.weatherModal!.currentModal.uv}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          height: 0.2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Pressure',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                                '${weatherProviderTrue.weatherModal!.currentModal.pressure_mb}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          height: 0.2,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Chance of rain',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                                '${weatherProviderTrue.weatherModal!.forcatModal.forcastday[0].day.daily_chance_of_rain}%',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          weatherProviderFalse.addFavCity(
                            weather!.locationModal.name,
                            weather.currentModal.temp_c.toString(),

                            weather.currentModal.condition.text,
                          );
                          Navigator.of(context).pushNamed('/fav');
                        },
                        child: Container(
                          height: 52,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Add city to favorite',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
String Day =
    "https://i.pinimg.com/originals/04/6f/51/046f5145ae962d44679c45198909043a.gif";
String Nigth =
    "https://i.pinimg.com/564x/4e/1f/84/4e1f848d64aadc6784cd07cd298a5391.jpg";