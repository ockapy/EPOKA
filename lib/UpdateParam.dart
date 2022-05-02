import 'dart:convert';
import 'package:epoka/main.dart';
import 'package:epoka/routeur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateParam extends StatefulWidget {
  @override
  State<UpdateParam> createState() => UpdateParamstate();
}

class UpdateParamstate extends State<UpdateParam> {
  final CommuneDepart = TextEditingController();
  final CommuneArriver = TextEditingController();
  final PositionCommune = List<dynamic>;
  bool error = false;

  setLocalData() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.clear();
  }

  @override
  Widget build(BuildContext context) {
    setLocalData();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromARGB(105, 105, 105, 105),
              Color.fromARGB(105, 105, 90, 105),
              Color.fromARGB(105, 105, 70, 105),
            ])),
        child: Center(
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.scaleDown,
            child: Container(
              width: 325,
              height: 470,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 12,
                    clipBehavior: Clip.hardEdge,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                           const ListTile(
                             

                          ),
                          if (error == true) ...[
                            Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  'Erreur, non reconnu.',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                          Container(
                            child: const Text(
                                  'Recherche Km',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: TextField(
                              controller: CommuneDepart,
                              decoration: const InputDecoration(
                                  labelText: "Commune Départ",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: TextField(
                              controller: CommuneArriver,
                              decoration: const InputDecoration(
                                  labelText: "Commune Arrivé",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                          ),
                            InkWell(
                            onTap: () {
                              var x = GetPose(CommuneDepart.text, CommuneArriver.text);
                              print(x);
                            },
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
                                        Color.fromARGB(255, 105, 105, 150),
                                        Color.fromARGB(255, 105, 90, 105),
                                        Color.fromARGB(255, 105, 70, 105),
                                      ])),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Rechercher',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Future<dynamic> updateForfait(String Journee, String Km) async {
    try {
      var url = Uri.parse(
          'http://127.0.0.1/epoka/UpdatePayment.php?Journee=$Journee&Km=$Km');
      final response = await http.get(url);
      return response;
    } catch (e) {
      print(e);
    }
  }
}

Future<dynamic> updateForfait() async {
  try {
    var url = Uri.parse('http://127.0.0.1/epoka/GetForfait.php?');
    final response = await http.get(url);
    return response;
  } catch (e) {
    print(e);
  }
}

Future<dynamic> GetPose(String VilleD, String VilleA) async {
  List<dynamic> mission = [];
  try {
    var url = Uri.parse(
        'http://127.0.0.1/epoka/GetPose.php?VilleD=$VilleD&VilleA=$VilleA');
    final response = await http.get(url);
    final List<dynamic> info = jsonDecode(response.body);
    final values = info[0];
   
     print(values);
     GetPrice(values["LongitudeDepart"], values["LongitudeArrivee"], values["LatitudeDepart"], values["LatitudeArrivee"]);
     return values;

    // var jetest = await GetPrice(values["LongitudeDepart"].toString(), values["LongitudeArrivee"].toString(), values["LatitudeDepart"].toString(), values["LatitudeArrivee"].toString()).then((value) => print(value));
  } catch (e) {
    print(e);
    throw Exception();
  }
}

Future<dynamic> GetPrice(String longitudeD, String longitudeA, String latitudeD,
    String latitudeA) async {
  List<dynamic> mission = [];
  int price = 0;
  try {
    var url = Uri.parse(
        'https://wxs.ign.fr/essentiels/itineraire/rest/route.json?origin=$longitudeD,$latitudeD&destination=$longitudeA,$latitudeA&&method=DISTANCE&graphName=Voiture');
    final response = await http.get(url);
    var info = jsonDecode(response.body);
    info.forEach((value) => mission.add(value));
    final values = info[0];
    //price = mission[3] * forfait;
    print("aled");
    print(values["distance"]);
    return values;
  } catch (e) {
    print(e);
  }
}
