import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tshitenge/routes/weather_route_manager.dart';
import 'package:tshitenge/view__model/weather_view_model.dart';

import '../../widgets/main_page_widgets/error_pop_up.dart';
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
  @override
  void dispose() {
    enterCityController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'CITY-WEATHER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Consumer<WeatherViewModel>(builder: ((context, model, child) {
                if (model.loading) {
                  return const CircularProgressIndicator();
                } else if (model.isError) {
                  return ErrorPopUp(message: model.errorMesssage);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        const WeatherIconWidget(),
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
                                SizedBox(
                                  height: 20,
                                ),
                                TemperatureWdget(),
                                SizedBox(
                                  width: 30,
                                ),
                                FeelsLikeWidget(),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const HumidityWidget(),
                            const SizedBox(
                              height: 30,
                            ),
                            const WeatherDescriptionWidget()
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }
              })),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: enterCityController,
                  onChanged: (changeOnValue) {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.lightBlue,
                ),
                onPressed: () {
                  context
                      .read<WeatherViewModel>()
                      .getData(enterCityController.text);
                },
                child: const Text('Search'),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(WeatherRouteManager.detailsPage);
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(child: Icon(Icons.more_horiz_rounded)),
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
