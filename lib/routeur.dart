import 'package:epoka/accueil.dart';
import 'package:epoka/main.dart';
import 'package:epoka/payment.dart';
import 'package:epoka/validation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class RoutePage extends StatefulWidget {
  @override
  State<RoutePage> createState() => RoutePageState();
}

class RoutePageState extends State<RoutePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List _widgetOptions = [
    HomePage(),
    Validation(),
    Payment(),
    MasterPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Future<bool> localData = getLocalData().then((value) => value);

 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: localData,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == false || snapshot.data == null) {
            return Material(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: Text("Accès Non autorisé")),
            );
          } else {
            return Scaffold(
              body: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 8.0,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.red,
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.check),
                      label: 'Validation',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.payments),
                    label: 'paiment des frais',
                    backgroundColor: Colors.purple,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'paramétrages',
                    backgroundColor: Color.fromARGB(197, 255, 0, 136),
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Color(0xFFFF8F00),
                onTap: _onItemTapped,
              ),
            );
          }
        });
  }
}

Future<bool> getLocalData() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    print(local.containsKey('isConnected'));
    if(local.containsKey('isConnected')){local.setBool('isConnected', true);}
    return local.containsKey('isConnected');
  }