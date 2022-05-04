class WeatherData {
  String cityName;
  String weatherIcon;
  String weatherDescription;
  double temperature;
  double feelsLike;
  double humidity;
  //
  double pressure;
  double windspeed;
  DateTime sunrise = DateTime(2022);
  DateTime sunset = DateTime(2022);

  WeatherData({
    required this.cityName,
    required this.weatherIcon,
    required this.weatherDescription,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    //
    required this.pressure,
    required this.windspeed,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var _weatherUrlIcon =
        'https://openweathermap.org/img/wn/${json['weather'][0]['icon'] as String}@2x.png';

    return WeatherData(
        cityName: json['name'] as String,
        weatherIcon: _weatherUrlIcon,
        weatherDescription: json['weather'][0]['description'] as String,
        temperature: json['main']['temp'].toDouble(),
        feelsLike: json['main']['feels_like'].toDouble(),
        humidity: json['main']['humidity'].toDouble(),
        pressure: json['main']['pressure'].toDouble(),
        windspeed: json['wind']['speed'].toDouble(),
        sunrise: DateTime.fromMillisecondsSinceEpoch(
            json['sys']['sunrise'] * 1000 as int,
            isUtc: true),
        sunset: DateTime.fromMillisecondsSinceEpoch(
            json['sys']['sunrise'] * 1000 as int,
            isUtc: true));
  }
}
