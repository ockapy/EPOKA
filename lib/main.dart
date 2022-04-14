

import 'package:epoka/login.dart';
import 'package:epoka/routeur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final storage = await SharedPreferences.getInstance();
  runApp(MyApp(
    storage: storage,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences storage;
  const MyApp({Key? key, required this.storage})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MasterPage(storage),
        '/Home': (context) => RoutePage(storage),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
