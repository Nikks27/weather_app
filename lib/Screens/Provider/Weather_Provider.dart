import 'package:flutter/material.dart';

import '../Api_Helper/Api1_Helper.dart';
import '../Modal/Weather_Modal.dart';

class HomeProvider extends ChangeNotifier {
  List weather =[];
  WeatherModal? weatherModal;
  String search = "Surat";
  int selectedIndex = 0;

  void Searchweather(String search) {
    this.search  = search;
    notifyListeners();
  }

  void SelectedImage(int index) {
    selectedIndex = index;
    notifyListeners();
  }



  Future<WeatherModal?> fromMap(String search) async {
    Map<String, dynamic> data = await ApiHelper.apihelper.fetchApiData(search: search);
    weatherModal = WeatherModal.fromJson(data);
    return weatherModal;
  }

  Future<void> AddToFav(String name,double temp_c,String text)
  async {
    String data="$name $temp_c $text";
    weather.add(data);
  }
  getFavouriteWeather()
  async {
    notifyListeners();
  }
  HomeProvider()
  {
    getFavouriteWeather();
  }
}
