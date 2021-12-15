import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dua/component/btn_gradient.dart';
import 'package:flutter_dua/theme/theme.dart';
import 'package:flutter_dua/ui/home_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 125, bottom: 19),
        child: Center(
          child: Text(
            "MAJ Restaurant",
            style: titleTextStyle,
          ),
        ),
      );
    }

    Widget sliderGet() {
      return CarouselSlider(
        options: CarouselOptions(
          height: 229,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
          pauseAutoPlayOnTouch: true,
        ),
        items: [1, 2].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Image.asset(
                  "assets/slider_get/slide$i.png",
                  width: 329,
                ),
              );
            },
          );
        }).toList(),
      );
    }

    Widget textGet() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Belajar Fundamental Aplikasi Flutter, Submission 2 : Restaurant App',
          style: greyTextStyle.copyWith(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          sliderGet(),
          SizedBox(
            height: height / 20,
          ),
          textGet(),
          SizedBox(
            height: height / 10,
          ),
          BtnGradient(
            text: const Text(
              "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            width: width - 208,
            border: BorderRadius.circular(50),
            proses: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
