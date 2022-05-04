import 'package:flutter/material.dart';

class AppLoadingBar extends StatelessWidget {
  const AppLoadingBar({Key? key, required this.loadingText}) : super(key: key);

  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 75, 33, 243),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(loadingText),
          ],
        ),
      ),
    );
  }
}
