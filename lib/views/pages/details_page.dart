import 'package:flutter/material.dart';
import '../../routes/weather_route_manager.dart';
import '../../widgets/details_page_widgets/speed_text.dart';
import '../../widgets/details_page_widgets/sunrise_text.dart';
import '../../widgets/details_page_widgets/sunset_text.dart';
import '../../widgets/details_page_widgets/pressure_text.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var WeatherService;

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(252, 100, 162, 255),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'MORE WEATHER INFO',
                    style: TextStyle(
                      color: Color.fromARGB(255, 46, 39, 176),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(WeatherRouteManager.mainPage);
                    },
                  )
                ],
              ),
            ),
////////Extracted WindSpeedWidget////////////
            const WindSpeedWidget(),

            const SizedBox(
              height: 10,
            ),
////////Extracted PressureWidget////////////
            const PressureWidget(),

            const SizedBox(
              height: 10,
            ),
////////Extracted SunriseWidget////////////
            const SunriseWidget(),

            const SizedBox(
              height: 10,
            ),
////////Extracted SunseteWidget////////////
            const SunsetWidget(),

            const SizedBox(
              height: 10,
            ),
////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}




// ////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// class DetailsPage extends StatelessWidget {
//   const DetailsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // var WeatherService;

//     return Scaffold(
//       body: Container(
//         color: const Color.fromARGB(252, 100, 162, 255),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 5.0,
//                 right: 5.0,
//                 top: 30.0,
//                 bottom: 10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'MORE WEATHER INFO',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 46, 39, 176),
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () {
//                       //            Navigator.of(context)
//                       //                .pushNamed(WeatherRouteManager.mainPage);
//                     },
//                   )
//                 ],
//               ),
//             ),
// ////////Extracted WindSpeedWidget////////////
//             //   const WindSpeedWidget(),

//             const SizedBox(
//               height: 10,
//             ),
// ////////Extracted PressureWidget////////////
//             //  const PressureWidget(),

//             const SizedBox(
//               height: 10,
//             ),
// ////////Extracted SunriseWidget////////////
//             //  const SunriseWidget(),

//             const SizedBox(
//               height: 10,
//             ),
// ////////Extracted SunseteWidget////////////
//             //   const SunsetWidget(),

//             const SizedBox(
//               height: 10,
//             ),
// ////////////////////////////////////////////
//           ],
//         ),
//       ),
//     );
//   }
// }
