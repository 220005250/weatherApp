import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tshitenge/view__model/weather_view_model.dart';

class ErrorPopUp extends StatefulWidget {
  final String message;
  const ErrorPopUp({Key? key, required this.message}) : super(key: key);

  @override
  State<ErrorPopUp> createState() => _ErrorPopUpState();
}

class _ErrorPopUpState extends State<ErrorPopUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: [
        const Icon(
          Icons.info_outline_rounded,
          size: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(widget.message),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          child: const Text('Ok'),
          onPressed: () {
            Provider.of<WeatherViewModel>(context, listen: false).stopError();
          },
        )
      ]),
    );
  }
}
