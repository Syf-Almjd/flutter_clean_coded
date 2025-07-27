import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_assets.dart';

class IntroScreenViewmodel {
  List<PageViewModel>? pages = [
    PageViewModel(
      title: "Benvenuti a Bella Vita",
      body:
          "Siamo un ristorante italiano specializzato in piatti di carne di alta qualità.",
      image: Center(
        child: Image.asset(AppAssets.introScreenFirst, height: 200),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    ),
    PageViewModel(
      title: "La nostra filosofia",
      body:
          "Crediamo che la buona cucina debba essere fatta con ingredienti di qualità e con amore.",
      image: Center(
        child: Image.asset(AppAssets.introScreenSecond, height: 200),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    ),
    PageViewModel(
      title: "Vi aspettiamo",
      body:
          "Vieni a trovarci e scopri la nostra selezione di piatti e vini selezionati.",
      image: Center(
        child: Image.asset(AppAssets.introScreenThird, height: 200),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    ),
  ];
}
