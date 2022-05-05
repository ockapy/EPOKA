import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Validation extends StatefulWidget {
  @override
  State<Validation> createState() => ValidationState();
}

final Map<dynamic, bool> index = {};

class ValidationState extends State<Validation> {
  final Future<List<dynamic>> mission = getData().then((value) => value);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mission,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Container(
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
                    child: FractionallySizedBox(
                      heightFactor: 0.7,
                      widthFactor: 0.6,
                      child: SingleChildScrollView(
                        child: Column(
                          children: snapshot.data!.map<Widget>((element) {
                            return Card(
                              elevation: 22,
                              child: Column(children: [
                                 Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                index[element] = !index[element]!;
                              });
                                    },
                                    customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                    child: const Icon(Icons.info,
                                    size: 40, color: Colors.blue,)
                                  )
                                ),
                                const SizedBox(height: 10),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        element['Intituler'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " Commune de départ : " + element["NomCommune"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        element["DateDebut"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt,
                                        size: 40,
                                      ),
                                      Text(
                                        element["DateFin"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        element["NomUtilisateur"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                      const Text(
                                        ' Km :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                      const Text(
                                        ' 575 ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Visibility(
                                    visible: index[element]!,
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          element["Description"],
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ))),
                                InkWell(
                                  onTap: () {
                                    print('hey');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 250,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xFF8A2387),
                                              Color(0xFFBE4B54),
                                              Color(0xFFF27121),
                                            ])),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        'Valider',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                ),
                              ]),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )),
            );
          } else {
            return const SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
          }
        });
  }
}

Future<dynamic> getData() async {
  List<dynamic> mission = [];

  try {
    var url = Uri.parse('http://192.168.1.185/epoka/validation.php');
    final response = await http.get(url);
    var info = jsonDecode(response.body);
    info.forEach((value) {
      mission.add(value);
      index.addAll({value: false});
    });
    return mission;
  } catch (e) {
    print(e);
  }
}
