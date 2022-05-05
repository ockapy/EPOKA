import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  double _currentSliderValue = 20;
  double _currentSliderValue2 = 0;

  final depart = TextEditingController();
  final arrive = TextEditingController();
  final distance = TextEditingController();

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
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 22,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text("Tarification"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            Text('Remboursement à la journée'),
                            Text(
                                _currentSliderValue.round().toStringAsFixed(0) +
                                    ' €'),
                            Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 100,
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Remboursement au kilomètre'),
                            Text(
                                _currentSliderValue2.toStringAsFixed(2) + ' €'),
                            Slider(
                              value: _currentSliderValue2,
                              max: 50,
                              onChanged: (double value) {
                                setState(() {
                                  print(value);
                                  _currentSliderValue2 = value;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Ajouter une distance.'),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: depart,
                            decoration: const InputDecoration(
                                suffix: Icon(
                                  Icons.border_color,
                                  color: Colors.blue,
                                ),
                                labelText: "Ville de départ",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: arrive,
                            decoration: const InputDecoration(
                                suffix: Icon(
                                  Icons.border_color,
                                  color: Colors.blue,
                                ),
                                labelText: "Ville d'arrivée",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: distance,
                            decoration: const InputDecoration(
                                suffix: Icon(
                                  Icons.border_color,
                                  color: Colors.blue,
                                ),
                                labelText: "Distance (KM)",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            print("ok");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Ajouter',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 40,),
                    
                    Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Container(
                             height: 32,
                              child: Align(alignment: Alignment.center, child: Text("Ville de départ")),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 32,
                                 child: Align(alignment: Alignment.center, child: Text("Ville d'arrivée")),
                              ),
                            ),
                            Container(
                              height: 32,
                               child: Align(alignment: Alignment.center, child: Text("Distance (Km)")),
                            ),
                          ],
                        ),
                        TableRow(
                          
                          children: <Widget>[
                           Container(
                             height: 32,
                              child: Align(alignment: Alignment.center, child: Text("38170 - SEYSSINET-PARISET")),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 32,
                                 child: Align(alignment: Alignment.center, child: Text("75000 - PARIS")),
                              ),
                            ),
                            Container(
                              height: 32,
                               child: Align(alignment: Alignment.center, child: Text("575 km")),
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
