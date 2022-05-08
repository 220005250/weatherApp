import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tshitenge/models/weather_data_model.dart';
import 'package:tshitenge/routes/weather_route_manager.dart';
import 'package:tshitenge/services/weather_services.dart';
import 'package:tshitenge/view__model/weather_view_model.dart';

import '../../widgets/main_page_widgets/feels_like_text.dart';
import '../../widgets/main_page_widgets/humidity_text.dart';
import '../../widgets/main_page_widgets/temperature_text.dart';
import '../../widgets/main_page_widgets/weather_description_text.dart';
import '../../widgets/main_page_widgets/weather_icon.dart';
import '../../widgets/main_page_widgets/city_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
//
  TextEditingController enterCityController = TextEditingController();
  WeatherData? everything;
//
  @override
  void dispose() {
    enterCityController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var cityName;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0, 1.0],
          colors: [Colors.lightBlue.shade800, Colors.lightBlue.shade400],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                  top: 30.0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        'CITY-WEATHER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    WeatherIconWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    const CityNameWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            const SizedBox(
                              height: 20,
                            ),
                            TemperatureWdget(),
                            const SizedBox(
                              width: 30,
                            ),
                            FeelsLikeWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        HumidityWidget(),
                        SizedBox(
                          height: 30,
                        ),
                        WeatherDescriptionWidget()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: enterCityController,
                  onChanged: (changeOnValue) {
                    // WeatherViewModel.getData(changeOnValue);
                  },
                  // keyboardType: TextInputType.name,
                  // style: const TextStyle(color: Colors.white),
                  //  onChanged: (input) =>,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<WeatherViewModel>()
                        .getData(enterCityController.text);
                  },
                  child: const Text('Search'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(WeatherRouteManager.detailsPage);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      'MORE WEATHER INFO',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
