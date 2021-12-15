import 'package:flutter/material.dart';
import 'package:flutter_dua/theme/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: lightMode ? green : green,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
              child: lightMode
                  ? Image.asset('assets/images/logo.png')
                  : Image.asset('assets/images/logo.png')),
        ),
      ),
    );
  }
}
