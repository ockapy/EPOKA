import 'dart:convert';
import 'package:epoka/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MasterPage extends StatefulWidget {
  @override
  State<MasterPage> createState() => MasterPageState();
}

class MasterPageState extends State<MasterPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
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
                Color.fromARGB(255, 255, 0, 134),
                Color.fromARGB(255, 33, 59, 255),
                Color.fromARGB(255, 255, 161, 0),
              ])),
          child: Center(
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
                            title: Icon(
                              Icons.account_circle,
                              size: 60,
                            ),
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
                            padding: const EdgeInsets.all(8),
                            child: TextField(
                              controller: username,
                              decoration: const InputDecoration(
                                  suffix: Icon(
                                    Icons.mail_outline_outlined,
                                    color: Colors.red,
                                  ),
                                  labelText: "Email Address",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  suffix: Icon(
                                    Icons.lock,
                                    color: Colors.red,
                                  ),
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              login(username.text, password.text);
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
                                        Color(0xFF8A2387),
                                        Color(0xFFE94057),
                                        Color(0xFFF27121),
                                      ])),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Login',
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
    );
  }

  Future<dynamic> login(String login, String password) async {
    try {
      var url = Uri.parse(
          'http://127.0.0.1/epoka/login.php?identifier=$login&mdp=$password');
      final response = await http.get(url);
      Map<String, dynamic> map = Map.castFrom(json.decode(response.body));
       var utilisateur = User.fromJson(map);
      controller.add(utilisateur);
      Navigator.pop(context);
      Navigator.of(context).pushNamed("/Home");
    } catch (e) {
      setState(() {
        error = true;
      });
      print(e);
    }
  }
}

class User {
  int id;
  String? idSup;
  String nom;
  String prenom;
  int tel;
  int isComptable;
  String clee;
  int idAgence;

  User(this.id, this.idSup, this.nom, this.prenom, this.tel, this.isComptable,
      this.clee, this.idAgence);

  User.fromJson(Map<String, dynamic> json)
      : id = int.parse(json["Id"]) ,
        idSup = json["IdSup"],
        nom = json["Nom"] as String,
        prenom = json["Prenom"] as String,
        tel = int.parse(json["Tel"]),
        isComptable = int.parse(json["IsComptable"]),
        clee = json["Clee"] as String,
        idAgence = int.parse(json["IdAgence"]);

}
