import 'dart:convert';
import 'dart:html';

import 'package:epoka/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Validation extends StatefulWidget {
  late List<dynamic> data = [];

  @override
  State<Validation> createState() => ValidationState();
}

class ValidationState extends State<Validation> {
  bool description = false;
  var mission = [];

  @override
  void initState() {
    super.initState();

    GetData().then((result) {
      
      setState(() {
        mission = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purpleAccent,
                      Colors.amber,
                      Colors.blue,
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width - 100,
                    child: Column(
                      children: mission
                          .map(
                            (element) => Card(
                              elevation: 22,
                              child: Column(children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      element['Intituler'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    FloatingActionButton.small(
                                        onPressed: (() {
                                          setState(() {
                                            description = !description;
                                          });
                                        }),
                                        child: const Icon(
                                          Icons.add,
                                          size: 40,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      element["NomCommune"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      element["DateDebut"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Icon(
                                      Icons.arrow_right_alt,
                                      size: 40,
                                    ),
                                    Text(
                                      element["DateFin"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      element["NomUtilisateur"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      ' Km :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      ' Km ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                  ],
                                ),
                                if (description == true) ...[
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      child: const Text(
                                        'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                                const SizedBox(height: 30),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                ),
                              ]),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
  }

  Future<dynamic> GetData() async {
    List<dynamic> mission = [];
    try {
      var url = Uri.parse('http://127.0.0.1/epoka/validation.php');
      final response = await http.get(url);
      var info = jsonDecode(response.body);
     mission.add(info);
      print(info);
    } catch (e) {
      print(e);
    }
    return mission;
  }
