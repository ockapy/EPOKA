import 'package:epoka/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  SharedPreferences storage;
  HomePage(this.storage);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final intitule = TextEditingController();
  final desc = TextEditingController();
  final address = TextEditingController();
  final postal = TextEditingController();
  final debut = TextEditingController();
  final fin = TextEditingController();

 

 @override
  Widget build(BuildContext context) {
     final Future<User> user = getLocalData(widget.storage).then((value) => value);
    return 
     FutureBuilder(
       future: user,
       builder: (BuildContext context, AsyncSnapshot<User> snapshot) {

       if(snapshot.connectionState == ConnectionState.done){
       return Scaffold(
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
                  child: Card(
                      elevation: 22,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          Text("Bienvenue sur EPOKA"),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Ajout de mission'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: intitule,
                                        decoration: const InputDecoration(
                                            suffix: Icon(
                                              Icons.border_color,
                                              color: Colors.blue,
                                            ),
                                            labelText: "intitulé de la mission",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: desc,
                                        decoration: const InputDecoration(
                                            suffix: Icon(
                                              Icons.border_color,
                                              color: Colors.blue,
                                            ),
                                            labelText: "Description",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: address,
                                        decoration: const InputDecoration(
                                            suffix: Icon(
                                              Icons.border_color,
                                              color: Colors.blue,
                                            ),
                                            labelText: "Commune de départ",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: postal,
                                        decoration: const InputDecoration(
                                            suffix: Icon(
                                              Icons.border_color,
                                              color: Colors.blue,
                                            ),
                                            labelText: "Commune d'arrivée",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: debut,
                                        decoration: const InputDecoration(
                                            suffix: Icon(
                                              Icons.border_color,
                                              color: Colors.blue,
                                            ),
                                            labelText: "Date de début",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: fin,
                                        decoration: const InputDecoration(
                                            suffix: Icon(
                                              Icons.border_color,
                                              color: Colors.blue,
                                            ),
                                            labelText: "Date de fin",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Annuler'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'OK');
                                      addMission(snapshot.data?.id,address,debut,fin,intitule,desc);
                                      print("ok");
                                    },
                                    child: const Text('Ajouter la mission'),
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
                                  'Ajouter une mission',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ]),
                      )),
                )),
          ),
        ),
         );
       }
       else{
          return const SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
       }
       }
     );
    
  }

  
}

void addMission(id, commune, debut, fin, intitule, desc) async {

  try {
    var url = Uri.parse('http://10.38.171.147/epoka/AddMission.php?ID=$id&Commune=$commune&Debut=$debut&Fin=$fin&Intitule=$intitule&Desc=$desc');
    final response = await http.get(url);
    var info = jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
}
Future<User> getLocalData(SharedPreferences storage) async {
  try {
    print(storage.getStringList('user'));
    User user = User.fromList(storage.getStringList('user')!);
    print(user);

    return user;
  } catch (e) {
    throw Exception("perdu !!");
  }
}