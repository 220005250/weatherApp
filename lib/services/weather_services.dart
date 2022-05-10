import 'dart:convert';
import 'package:http/http.dart';
import 'package:tshitenge/models/weather_data_model.dart';

class WeatherServices {
  static const String apiKey = '75496fababd0f36f42d3e246cdcce60e';

  static Future<WeatherData> getJsonData(String city) async {
    Map<String, dynamic> jsonMap = {};
    WeatherData weatherData;
    Response response;

    try {
      response = await get(
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey'),
      );
    } catch (e) {
      throw Exception(e.toString());
    }

    if (response.statusCode == 200) {
      try {
        jsonMap = jsonDecode(response.body);
        weatherData = WeatherData.fromJson(jsonMap);
      } catch (e) {
        throw Exception(e.toString());
      }
    } else if (response.statusCode == 404) {
      throw CityNotFound('City not Found');
    } else if (response.statusCode == 400) {
      throw BadRequest("Bad Request");
    } else {
      throw Exception("An error occured.");
    }
    return weatherData;
  }
}

class CityNotFound {
  final String message;
  CityNotFound(this.message);
  @override
  String toString() => message;
}

class BadRequest {
  final String message;
  BadRequest(this.message);
  @override
  String toString() => message;
}
