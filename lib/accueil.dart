import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
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
                                          labelText: "Adresse",
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
                                          labelText: "Code Postal",
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
}
