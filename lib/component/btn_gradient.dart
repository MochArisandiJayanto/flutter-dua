import 'package:flutter/material.dart';
import 'package:flutter_dua/theme/theme.dart';

class BtnGradient extends StatelessWidget{
  const BtnGradient({
    Key? key,
    required this.text,
    required this.width,
    required this.border,
    required this.proses
  }) : super(key: key);

  final Text text;
  final width;
  final border;
  final proses;

  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              bluelightColor,
              blueColor,
            ]),
        borderRadius: border,
      ),
      child: TextButton(
        onPressed: proses,
        child: text,
      ),
    );
  }
}