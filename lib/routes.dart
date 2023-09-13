
import 'package:flutter/widgets.dart';
import 'package:pmsn20232/screens/dashboard_screen.dart';
import 'package:pmsn20232/screens/onboarding_page.dart';

Map<String,WidgetBuilder> getRoutes(){
  return{
    '/dash' : (BuildContext contex) => const DashboardScreen(),
    '/onboard' : (BuildContext context) => OnboardingPage(),
  };
}