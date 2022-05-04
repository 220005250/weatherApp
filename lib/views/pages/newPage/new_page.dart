import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:tshitenge/view__model/weather_view_model.dart';
import 'package:tshitenge/views/pages/newPage/themes.dart';
import 'weather_widget.dart';

enum OptionsMenu { changeCity, settings }

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>
    with TickerProviderStateMixin {
  String _cityName = 'bengaluru';
  late Animation<double> _fadeAnimation;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Themes.getTheme();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.primaryColor,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DateTime.now().toIso8601String(),
                style: TextStyle(
                  color: appTheme.accentColor.withAlpha(80),
                  fontSize: 14,
                ),
              )
            ],
          ),
          actions: <Widget>[
            PopupMenuButton<OptionsMenu>(
                child: Icon(
                  Icons.more_vert,
                  color: appTheme.accentColor,
                ),
                onSelected: this._onOptionMenuItemSelected,
                itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
                      PopupMenuItem<OptionsMenu>(
                        value: OptionsMenu.changeCity,
                        child: Text("change city"),
                      ),
                      PopupMenuItem<OptionsMenu>(
                        value: OptionsMenu.settings,
                        child: Text("settings"),
                      ),
                    ])
          ],
        ),
        backgroundColor: Colors.white,
        body: Material(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(color: appTheme.primaryColor),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child:
                  Consumer<WeatherViewModel>(builder: (context, viewModel, _) {
                _fadeController.reset();
                _fadeController.forward();

                if (viewModel.loading) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: appTheme.primaryColor,
                    ),
                  );
                } else if (!viewModel.loading) {
                  this._cityName = viewModel.cityName!;
                  return WeatherWidget(
                    weather: viewModel.weatherData,
                  );
                } else if (viewModel.isError) {
                  return Center(child: Text(viewModel.errorMesssage));
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.error_outline,
                        color: Colors.redAccent,
                        size: 24,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        viewModel.errorMesssage,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: appTheme.accentColor,
                          elevation: 1,
                        ),
                        child: const Text("Try Again"),
                        onPressed: () {
                          Provider.of<WeatherViewModel>(context, listen: false)
                              .getData(_cityName);
                        },
                      )
                    ],
                  );
                }
              }),
            ),
          ),
        ));
  }

  void _showCityChangeDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          ThemeData appTheme = Themes.getTheme();

          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Change city', style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                child: Text('ok'),
                style: TextButton.styleFrom(
                  primary: appTheme.accentColor,
                  elevation: 1,
                ),
                onPressed: () {
                  context.read<WeatherViewModel>().getData(_cityName);
                  Navigator.of(context).pop();
                },
              ),
            ],
            content: TextField(
              autofocus: true,
              onChanged: (text) {
                _cityName = text;
              },
              decoration: InputDecoration(
                  hintText: 'Name of your city',
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      context.read<WeatherViewModel>().getData(_cityName);
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.my_location,
                      color: Colors.black,
                      size: 16,
                    ),
                  )),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          );
        });
  }

  _onOptionMenuItemSelected(OptionsMenu item) {
    switch (item) {
      case OptionsMenu.changeCity:
        this._showCityChangeDialog();
        break;
      case OptionsMenu.settings:
        Navigator.of(context).pushNamed("/settings");
        break;
    }
  }
}
