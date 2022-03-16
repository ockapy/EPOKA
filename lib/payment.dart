import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
    bool Description = false;
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
                Color.fromARGB(255, 255, 123, 0),
                Color.fromARGB(255, 253, 158, 68),
                Color.fromARGB(255, 255, 123, 0),
              ],
            ),
          ),
         child: Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width - 100,
                child: Column(children: [
                Card(
                    elevation: 22,
                    child: Column(children: [
                      const SizedBox(height: 10),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                           const Text(
                            'intituler',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                                
                          ),
                          const SizedBox(width: 20,),
                          FloatingActionButton.small(backgroundColor: Colors.orange,onPressed: (() {
                           setState(() {
                             Description = !Description;
                           }); 
                        
                      }), child: const Icon(Icons.add, size: 40,)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [

                           Text(
                            ' Commune A',
                            style:   TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                            Text(
                            'Date D ',
                            style:   TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                          Icon(Icons.arrow_right_alt, size: 40, ),
                           Text(
                            ' Date A',
                            style:   TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                            Text(
                            'Utilisateur  ',
                            style:   TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),

                           Text(
                            ' Km :',
                            style:   TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),

                          Text(
                            ' Km ',
                            style:   TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                                
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          InkWell(
                            onTap: () {
                              print("remboursement");
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
                                  'Rembourser',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]
                        ),

                      if( Description == true) ...[
                       Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                      const SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        
                      ),
                    ])),
                  ],)
              )),
        ),
      ),
    );
  }
}
