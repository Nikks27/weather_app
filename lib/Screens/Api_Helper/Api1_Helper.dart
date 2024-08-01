import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';


class ApiHelper
{
  Future<Map> fetchApi(String search)
  async {
    Uri url = Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=fe03c15645ad4c5eac8100541243007&q=$search');

    Response response = await http.get(url);

    if(response.statusCode == 200)
    {
      final json = response.body;
      print('api called');
      final Map data = jsonDecode(json);
      return data;
    }
    else
    {
      return {};
    }
  }
}