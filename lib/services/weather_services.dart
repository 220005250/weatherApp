import 'dart:convert';
import 'package:http/http.dart';
import 'package:tshitenge/models/weather_data_model.dart';

class WeatherServices {
  //static String city = 'welkom';

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
    } else {
      throw Exception();
    }
    return weatherData;
  }
}





// **************************************************************************
// //trial&Error
// Future<void> main(List<String> args) async {
//   var data = await getWeatherData();

//   //print maps
//   print(data['main']['temp']);
//   print(data['main']['feels_like']);
//   print(data['main']['pressure']);
//   print(data['main']['humidity']);
//   print(data['wind']['speed']);
//   print(data['sys']['sunrise']);
//   print(data['sys']['sunset']);
//   print(data['name']);

//   //print list
//   //List weather = data['weather'];
//   // for(var i=0; weather.length; i++)
//   // {
//   //    print(data['weather'][0]['description']);
//   //    print(data['weather'][0]['icon']);
//   // }
//   print(data['weather'][0]['description']);
//   print(data['weather'][0]['icon']);
// }

// String _city = 'Welkom';

// const String _apiKey = '75496fababd0f36f42d3e246cdcce60e';

// Future<Map> getWeatherData() async {
//   Map<dynamic, dynamic> map = {};
//   final response = await get(Uri.parse(
//     'http://api.openweathermap.org/data/2.5/weather?q=welkom&units=metric&appid=75496fababd0f36f42d3e246cdcce60e',
//   ));

//   if (response.statusCode == 200) {
//     try {
//       map = jsonDecode(response.body);
//       print(map);
//     } catch (e) {
//       'error occured while loading map!';
//     }
//   }
//   return map;
// }
