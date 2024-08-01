import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_Helper/Api1_Helper.dart';
import '../Modal/Weather_Modal.dart';

class WeatherProvider extends ChangeNotifier {
  String search ='surat';
  ApiHelper apiHelper = ApiHelper();
  WeatherModal? weatherModal;
  String weather = '';

  List<WeatherModal> wratherList=[];

  Future<WeatherModal?> fromMap(String city) async {
    final data = await apiHelper.fetchApi(search);
    weatherModal = WeatherModal.fromJson(data);
    return weatherModal;
  }

  void searchCity(String city) {
    search = city;
    notifyListeners();
  }

  void addToFavoriteWeather(WeatherModal weather)
  {
    wratherList.add(weather);
  }
  Future<void> addFavCity(String name,String temp,String )
  async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  }
}