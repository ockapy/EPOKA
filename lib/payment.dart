import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => PaymentState();
}

final Map<dynamic, bool> index = {};

class PaymentState extends State<Payment> {
  bool description = false;
  Future<List<dynamic>> mission = getData().then((value) => value);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mission,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            try {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(252, 92, 0, 1),
                      Color.fromARGB(255, 255, 128, 55),
                      Color.fromARGB(255, 255, 153, 94),
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
                                      customBorder: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      child: const Icon(
                                        Icons.info,
                                        size: 40,
                                        color: Colors.blue,
                                      ))),
                              const SizedBox(height: 10),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                width: MediaQuery.of(context).size.width - 200,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " Commune : " + element["NomCommune"],
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Payment'),
                                    content: const Text(
                                        'Voulez vous vraiment payer cette mission ?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Non'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'OK');
                                          updateState(element["Id"]);
                                        },
                                        child: const Text('Oui'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 250,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xFF8A2387),
                                            Color(0xFFE94057),
                                            Color(0xFFF27121),
                                          ])),
                                  child: const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      'Payer',
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
                                width: MediaQuery.of(context).size.width - 200,
                              ),
                            ]),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              );
            } catch (error) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(252, 92, 0, 1),
                      Color.fromARGB(255, 255, 128, 55),
                      Color.fromARGB(255, 255, 153, 94),
                    ],
                  ),
                ),
                child: Center(
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.scaleDown,
                    child: Container(
                      width: 325,
                      height: 325,
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 12,
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                          child: Text(
                            "Pas de mission à payer",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Future<dynamic> updateState(String Id) async {
    try {
      var url =
          Uri.parse('http://10.38.171.147/epoka/UpdatePayment.php?ID=$Id');
      final response = await http.get(url);
      setState(() {
        mission = getData().then((value) => value);
      });
    } catch (e) {
      print(e);
    }
  }
}

Future<dynamic> getData() async {
  List<dynamic> mission = [];

  try {
    var url = Uri.parse('http://10.38.171.147/epoka/Payment.php');
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
