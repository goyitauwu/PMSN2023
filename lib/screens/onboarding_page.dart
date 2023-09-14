import 'package:pmsn20232/screens/dashboard_screen.dart';
import 'package:pmsn20232/widget/card_planet.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "Tierra",
      subtitle:
          "The night sky has much to offer to those who seek its mystery.",
      image: const AssetImage("tierra2.png"),
      backgroundColor: const Color.fromARGB(255, 115, 190, 250),
      titleColor: const Color.fromARGB(255, 0, 15, 75),
      subtitleColor: const Color.fromARGB(255, 0, 15, 75),
      background: LottieBuilder.asset("moradito.json"),
    ),
    CardPlanetData(
      title: "Marte",
      subtitle: "An endless number of galaxies means endless possibilities.",
      image: const AssetImage("marte.png"),
      backgroundColor: const Color.fromARGB(255, 225, 100, 10),
      titleColor: const Color.fromARGB(255, 110, 5, 5),
      subtitleColor: const Color.fromARGB(255, 110, 5, 5),
      background: LottieBuilder.asset("bg2.json"),
    ),
    CardPlanetData(
      title: "Jupiter",
      subtitle: "The sky dome is a beautiful graveyard of stars.",
      image: const AssetImage("jupiter.png"),
      backgroundColor: const Color.fromARGB(255, 245, 200, 35),
      titleColor: const Color.fromARGB(255, 100, 50, 0),
      subtitleColor: const Color.fromARGB(255, 100, 50, 0),
      background: LottieBuilder.asset("bg3.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (index) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        },
      ),
    );
  }
}
