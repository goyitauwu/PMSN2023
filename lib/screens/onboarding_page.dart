import 'package:pmsn20232/screens/dashboard_screen.dart';
import 'package:pmsn20232/widget/card_planet.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "Pactica 1",
      subtitle:
          "The night sky has much to offer to those who seek its mystery.",
      image: const AssetImage("aguacate.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("moradito.json"),
    ),
    CardPlanetData(
      title: "Ingenieria en Sistemas Computacionales",
      subtitle: "An endless number of galaxies means endless possibilities.",
      image: const AssetImage("aguacate.png"),
      backgroundColor: Colors.green,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("moradito.json"),
    ),
    CardPlanetData(
      title: "Instituto Tecnologico de Celaya",
      subtitle: "The sky dome is a beautiful graveyard of stars.",
      image: const AssetImage("aguacate.png"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("moradito.json"),
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
