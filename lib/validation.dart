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
            return Container(
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
                    heightFactor: 0.8,
                    widthFactor: 0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: snapshot.data!.map<Widget>((element) {
                          return Card(
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
                                        index[element] = !index[element]!;
                                        setState(() {});
                                      }),
                                      child: const Icon(
                                        Icons.add,
                                        size: 40,
                                      )),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
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
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt,
                                    size: 40,
                                  ),
                                  Text(
                                    element["DateFin"],
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
                                    ' Km ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ],
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
                                            fontSize: 35),
                                      ))),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                              ),
                            ]),
                          );
                        }).toList(),
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
    var url = Uri.parse('http://127.0.0.1/epoka/validation.php');
    final response = await http.get(url);
    var info = jsonDecode(response.body);
    info.forEach((value) {
      print(value["Description"]);
      mission.add(value);
      index.addAll({value: false});
    });
    return mission;
  } catch (e) {
    print(e);
  }
}
