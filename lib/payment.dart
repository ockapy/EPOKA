import 'dart:convert';
import 'dart:html';

import 'package:epoka/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  bool description = false;
  var mission = [];
  var CompteurDesc = 0;

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
                      Color.fromRGBO(252, 92, 0, 1),
                      Color.fromARGB(255, 255, 128, 55),
                      Color.fromARGB(255, 255, 153, 94),
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
                                        backgroundColor: Colors.orange,
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
                                if (description == true) ...[
                                  Container(
                                      padding: const EdgeInsets.all(8),
                                      child: const Text(
                                        'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [

                                     Text(
                                      ' Remboursement : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),

                                  ],
                                ),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                     FloatingActionButton(
                                        onPressed: (() {

                                           updateState(element["Id"]).whenComplete(() => setState);
                                        }),
                                        backgroundColor: Colors.orange,
                                        child: const Icon(
                                          Icons.all_inbox,
                                          size: 40,
                                        )),

                                  ],
                                ),
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
    var url = Uri.parse('http://127.0.0.1/epoka/Payment.php');
    final response = await http.get(url);
    var info = jsonDecode(response.body);
    info.forEach((value) => mission.add(value));
    return mission;
  } catch (e) {
    print(e);
  }
}

Future<dynamic> updateState(String Id) async {
  try {
    var url = Uri.parse('http://127.0.0.1/epoka/UpdatePayment.php?ID=$Id');
    final response = await http.get(url);
    return response;
  } catch (e) {
    print(e);
  }
}