import 'package:cached_network_image/cached_network_image.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(WeatherRouteManager.mainPage);
                  },
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//////// Extracted WindSpeedWidget ////////////
              Container(
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ListTile(
                  leading: Image(
                    width: 20,
                    image: CachedNetworkImageProvider(
                        'https://img.icons8.com/tiny-color/344/experimental-wind-tiny-color.png',
                        maxHeight: 15),
                  ),
                  title: WindSpeedWidget(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
////////Extracted PressureWidget////////////
              Container(
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ListTile(
                  leading: Image(
                    width: 20,
                    image: CachedNetworkImageProvider(
                        'https://img.icons8.com/ultraviolet/344/pressure.png',
                        maxWidth: 15),
                  ),
                  title: PressureWidget(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
//////// Extracted SunriseWidget ////////////
              Container(
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ListTile(
                  leading: Image(
                    width: 30,
                    image: CachedNetworkImageProvider(
                        'https://img.icons8.com/color/344/sunrise.png',
                        maxWidth: 15),
                  ),
                  title: SunriseWidget(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
//////// Extracted SunseteWidget ////////////
              Container(
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const ListTile(
                  leading: Image(
                    width: 30,
                    image: CachedNetworkImageProvider(
                        'https://img.icons8.com/color/344/sunset.png',
                        maxWidth: 15),
                  ),
                  title: SunsetWidget(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
////////////////////////////////////////////
            ],
          ),
        ],
      ),
    ));
  }
}
