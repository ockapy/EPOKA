import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MasterPage extends StatefulWidget {
  @override
  State<MasterPage> createState() => MasterPageState();
}

class MasterPageState extends State<MasterPage> {
  bool register = false;

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
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const TextField(
                              decoration: InputDecoration(
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
                            child: const TextField(
                              decoration: InputDecoration(
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
                          if (register == true) ...[
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: const TextField(
                                decoration: InputDecoration(
                                    suffix: Icon(
                                      Icons.lock,
                                      color: Colors.red,
                                    ),
                                    labelText: "Username",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    )),
                              ),
                            ),
                          ],
                          InkWell(
                            onTap: () => post(),
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
                          const SizedBox(
                            height: 17,
                          ),
                          const Text(
                            "Don't have an account ?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: (() {
                                  setState(() {
                                    register = true;
                                  });
                                }),
                                child: const Text(
                                  "Register now",
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              )
                            ],
                          ),
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
}

Future<dynamic> post() async {
  var url = Uri.parse('http://127.0.0.1/epoka/index.php');

  final response = await http.get(url);
  print(response.body);
}
