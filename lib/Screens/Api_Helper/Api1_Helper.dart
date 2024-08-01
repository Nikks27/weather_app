import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';


class ApiHelper {
  static ApiHelper apihelper = ApiHelper._();
  ApiHelper._();

  Future<Map<String, dynamic>> fetchApiData({String search = "SURAT"}) async {
    String api = "https://api.weatherapi.com/v1/forecast.json?key=fe03c15645ad4c5eac8100541243007=$search";
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map<String, dynamic> data = jsonDecode(json) ;
      return data;
    } else {
      return {};
    }
  }
}
