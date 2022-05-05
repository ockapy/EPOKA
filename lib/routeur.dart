import 'package:epoka/Settings.dart';
import 'package:epoka/accueil.dart';
import 'package:epoka/payment.dart';
import 'package:epoka/profile.dart';
import 'package:epoka/validation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'dart:io' show Platform;

class RoutePage extends StatefulWidget {
  final SharedPreferences storage;

  RoutePage(this.storage);

  @override
  State<RoutePage> createState() => RoutePageState();
}

class RoutePageState extends State<RoutePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List _widgetOptions = [];
  static List _androidOptions = [];

  @override
  void initState() {
    _widgetOptions = [
      Payment(),
      SettingPage(),
    ];
    _androidOptions = [
      HomePage(),
      Validation(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Future<bool> localData =
        getLocalData(widget.storage).then((value) => value);

    return FutureBuilder(
        future: localData,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == false || snapshot.data == null) {
            return Material(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: const Text("Accès Non autorisé")),
            );
          } else {
            if (kIsWeb) {
              return Scaffold(
                body: Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  elevation: 8.0,
                  items: const <BottomNavigationBarItem>[
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
            } else {
              return Scaffold(
                body: Center(
                  child: _androidOptions.elementAt(_selectedIndex),
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
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Color(0xFFFF8F00),
                  onTap: _onItemTapped,
                ),
              );
            }
          }
        });
  }
}

Future<bool> getLocalData(SharedPreferences storage) async {
  print(storage.containsKey('user'));
  return storage.containsKey('user');
}



