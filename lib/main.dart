import 'dart:async';
import 'package:epoka/login.dart';
import 'package:epoka/payment.dart';
import 'package:epoka/routeur.dart';
import 'package:epoka/validation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'UpdateParam.dart';

void main() {
  runApp(const MyApp());
}

final controller = BehaviorSubject();
final dbStream = controller.stream;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String route = '/overview';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Payment(),
        '/Home': (context) => RoutePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
