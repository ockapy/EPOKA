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
                          FloatingActionButton.small(onPressed: (() {
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

                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          FloatingActionButton.small(onPressed: (() {
                           setState(() {
                             Description = !Description;
                           }); 
                        
                      }), child: const Icon(Icons.add, size: 40,)),
                        ],
                      ),

                      if( Description == true) ...[
                       Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
                                  style: TextStyle(
                                      color: Colors.red,
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
