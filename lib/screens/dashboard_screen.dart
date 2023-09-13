import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

import '../assets/global_values.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenidos :)'),
      ),
      drawer: createDrawer(),
    );
  }

  Widget createDrawer(){
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/102234549?v=4'),
            ),
            accountName: Text('Alan Saúl Sánchez Díaz'),
            accountEmail: Text('18030493@itcelaya.edu.mx')
          ),
          ListTile(
            leading: Image.asset('assets/aguacate.png'),
            trailing: const Icon(Icons.chevron_right),
            title: const Text('FruitApp'),
            subtitle: const Text('Carrusel'),
            onTap: (){},
          ),

          ListTile(
            leading: Image.asset('p1.png'),
            trailing: const Icon(Icons.chevron_right),
            title: const Text('Practica 1'),
            subtitle: const Text('Onboarding Screen'),
            onTap: (){
              Navigator.pushNamed(context, '/onboard');
            },
          ),

          ListTile(
            leading: Image.asset('p2.png'),
            trailing: const Icon(Icons.chevron_right),
            title: const Text('Practica 2'),
            subtitle: const Text('UI Challenge Fruit App'),
            onTap: (){
              Navigator.pushNamed(context, '/uicha');
            },
          ),





          DayNightSwitcher(
            isDarkModeEnabled: GlobalValues.flagTheme.value,
            onStateChanged: (isDarkModeEnabled) {
              setState(() {
                GlobalValues.flagTheme.value= isDarkModeEnabled;
              });
            },
          ),
        ],
      ),
    );
  }
}