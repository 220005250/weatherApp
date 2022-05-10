import 'package:flutter/cupertino.dart';
import 'package:tshitenge/models/weather_data_model.dart';
import 'package:tshitenge/services/weather_services.dart';

class WeatherViewModel with ChangeNotifier {
  late WeatherData _weatherData;

  WeatherViewModel() {
    _weatherData = WeatherData(
        cityName: "cityName",
        weatherIcon: "",
        weatherDescription: "",
        temperature: 0.0,
        feelsLike: 0.0,
        humidity: 0.0,
        pressure: 0.0,
        windspeed: 0.0,
        sunrise: DateTime.now(),
        sunset: DateTime.now());
  }

  void initWeather() {
    getData("Welkom");
  }

  WeatherData get weatherData => _weatherData;

//////////error handling//////////////
  bool? worldCity;

  bool _loading = false;

  String _errorMessage = '';
  String get errorMesssage => _errorMessage;

  bool _isError = false;
  bool get isError => _isError;
  bool get loading => _loading;

  String _loadingMessage = '';
  String get loadingMessage => _loadingMessage;

  void startLoading(String message) {
    _loading = true;
    _loadingMessage = message;
    notifyListeners();
  }

  void stopLoading() {
    _loading = false;
    notifyListeners();
  }

  void startError(String error) {
    _errorMessage = error;
    _isError = true;
    notifyListeners();
  }

  void stopError() {
    _isError = false;
    notifyListeners();
  }

//////////error handling ends//////////////
//WEATHERDATA
  WeatherData? _weather;
  //WeatherData? get weather => _weather;
//CITYNAME
  String _cityName = '';
  String? get cityName => _cityName;

//ICON
  String _weatherIcon = '';
  String? get weatherIcon => _weatherIcon;

//DESCRIPTION
  String _weatherDescription = '';
  String? get weatherDescription => _weatherDescription;

//TEMPERATURE
  double _temperature = 0.0;
  double get temperature => _temperature;

//FEELSLIKE
  double _feelsLike = 0.0;
  double? get feelsLike => _feelsLike;

//HUMIDITY
  double _humidity = 0.0;
  double get humidity => _humidity;

//PRESSURE
  double _pressure = 0.0;
  double get pressure => _pressure;

//WINDSPEED
  double _windspeed = 0.0;
  double get windspeed => _windspeed;

//SUNRISE
  DateTime _sunrise = DateTime(2022);
  DateTime get sunrise => _sunrise;
//SUNSET
  DateTime _sunset = DateTime(2022);
  DateTime get sunset => _sunset;

//************GETTING DATA FROM JSON********** */
  Future<WeatherData> getData(String city) async {
    startLoading('Loading json weather data. Please wait');
    try {
      _weatherData = await WeatherServices.getJsonData(city);

      _cityName = _weatherData.cityName;
      _weatherDescription = _weatherData.weatherDescription;
      _temperature = _weatherData.temperature;
      _weatherIcon = _weatherData.weatherIcon;
      _weatherDescription = _weatherData.weatherDescription;
      _humidity = _weatherData.humidity;
      _pressure = _weatherData.pressure;
      _windspeed = _weatherData.windspeed;
      _sunrise = _weatherData.sunrise;
      _sunset = _weatherData.sunset;
      _feelsLike = _weatherData.feelsLike;

      stopLoading();
    } catch (e) {
      stopLoading();
      startError(e.toString());
    }
    return _weatherData;
  }
}
