import 'package:flutter/material.dart';

class Validation extends StatefulWidget {
  @override
  @override
  State<Validation> createState() => ValidationState();
}

class ValidationState extends State<Validation> {
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
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width - 100,
                child: Card(
                    elevation: 22,
                    child: Column(children: [
                      const Text(
                        'Validation',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Table(
                          border: TableBorder.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              borderRadius: BorderRadius.circular(10),
                              width: 2),
                          children: [
                            TableRow(children: [
                              Column(children: const [
                                Text('Website',
                                    style: TextStyle(fontSize: 20.0))
                              ]),
                              Column(children: const [
                                Text('Tutorial',
                                    style: TextStyle(fontSize: 20.0))
                              ]),
                              Column(children: const [
                                Text('Review', style: TextStyle(fontSize: 20.0))
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('Javatpoint')]),
                              Column(children: const [Text('Flutter')]),
                              Column(children: const [Text('5*')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('Javatpoint')]),
                              Column(children: const [Text('MySQL')]),
                              Column(children: const [Text('5*')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('Javatpoint')]),
                              Column(children: const [Text('ReactJS')]),
                              Column(children: const [Text('5*')]),
                            ]),
                          ],
                        ),
                      ),
                    ])),
              )),
        ),
      ),
    );
  }
}
