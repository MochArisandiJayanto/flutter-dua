import 'package:flutter/material.dart';
import 'package:flutter_dua/screens/get_started.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAJ Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: GetStarted(),
    );
  }
}
