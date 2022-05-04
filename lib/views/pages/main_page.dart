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
    //var WeatherService;
    var cityName;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      //appbar
      body: Center(
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
                // ////////////////first row//////////////////////
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CITY-WEATHER',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
// /////////////////refresh icon on right/////////////////////
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.refresh))
                  ],
                ),
              ),
// //////////////////////////////////////
              const SizedBox(
                height: 40,
              ),
// //////////////////////////////////////

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: enterCityController,
                  onChanged: (changeOnValue) {
                    //  WeatherViewModel.getData(changeOnValue);
                  },
                  // keyboardType: TextInputType.name,
                  // style: const TextStyle(color: Colors.white),
                  //  onChanged: (input) =>,
                ),
              ),
// //////////////////////////////////////
              const SizedBox(
                height: 10,
              ),
// //////////////////////////////////////
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<WeatherViewModel>()
                        .getData(enterCityController.text);
                  },
                  child: const Text('Search')),
// //////////////////////////////////////
              const SizedBox(
                height: 80,
              ),
// //////////////////////////////////////

              // HomeBody

              Center(
                child: Column(
                  children: [
// ////////Extract CityNameWidget////////////
                    Text(
                      //WeatherServices.cityName.toUpperCase(),
                      context.read<WeatherViewModel>().cityName!,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w200),
                    ),

                    CityNameWidget(),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
// ////////Extracted WeatherIconWidget////////////
                        const WeatherIconWidget(),

                        Column(
                          children: const [
// ////////Extract TemperatureWidget////////////
                            TemperatureWdget(),

/////////Extracted FeelsLikeWidget////////////
                            FeelsLikeWidget(),

//////////Extracted HumidityWidget////////////
                            HumidityWidget(),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
//////////Extracted WeatherDescriptionWidget////////////
                    const WeatherDescriptionWidget(),

                    const SizedBox(
                      height: 20,
                    ),
                    /////////////////
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(WeatherRouteManager.detailsPage);
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.location_city_outlined),
                      Text(
                        'MORE WEATHER INFO',
                        style: TextStyle(color: Colors.purple, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// ////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:tshitenge/services/weather_services.dart';
// import '../../routes/weather_route_manager.dart';


// ////////////////////////////////////////////////////////////////////////

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// Map sephora = Map<String, dynamic>();

// class _MainPageState extends State<MainPage> {
//   final _cityTextController = TextEditingController();
//   final _weatherServices = WeatherServices();

//   WeatherServices? _onlineTest;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// //***************************************************** */
//       appBar: AppBar(
//         backgroundColor: Colors.blue[400],
//         title: const Center(
//           child: Text(
//             'SEPHORA WEATHER APP',
//             style: TextStyle(fontSize: 30),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),

// //***************************************************** */
//       backgroundColor: Colors.blueGrey,

//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               //******************************************************** */
//               if (_onlineTest != null)
//                 Column(
//                   children: const [
//                     //Image.network(_onlineTest!.weatherIcon),
//                     // Text(
//                     //   '${_onlineTest!.mainInfo.temperature.toDouble()}°',
//                     //   style: const TextStyle(fontSize: 40),
//                     // ),
//                     //  Text(
//                     //    'Description: ${_onlineTest!.WeatherViewModel }',
//                     //    style: const TextStyle(fontSize: 20),
//                     // ),
//                     // Text(
//                     //   'Feels like: ${_onlineTest!.mainInfo.feelslike.toDouble()}',
//                     //   style: const TextStyle(fontSize: 20),
//                     // ),
//                     // Text(
//                     //   'Humidity: ${_onlineTest!.mainInfo.humidity.toDouble()}',
//                     //   style: const TextStyle(fontSize: 20),
//                     // ),
//                     //),
//                   ],
//                 ),

//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 50),
//                 child: SizedBox(
//                   width: 150,
//                   child: TextField(
//                       controller: _cityTextController,
//                       decoration: const InputDecoration(labelText: 'City'),
//                       textAlign: TextAlign.center),
//                 ),
//               ),
//               ElevatedButton(onPressed: _search, child: const Text('Search')),
//               //
//               ElevatedButton(
//                 child: const Text(
//                   'More Weather Details',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context)
//                       .popAndPushNamed(WeatherRouteManager.detailsPage);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _search() async {
//     final onlineTest =
//         await WeatherServices.getJsonData(_cityTextController.text);

//     setState(
//       () => _onlineTest = onlineTest as WeatherServices?,

//       // sephora = {
//       //   'cityName': onlineTest?.cityName,
//       //   'description': onlineTest.weather,
//       // };
//     );
//   }
// }
