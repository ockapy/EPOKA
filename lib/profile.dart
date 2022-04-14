import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class ProfilePage extends StatefulWidget {
  final SharedPreferences storage;

  ProfilePage(this.storage);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLocalData(widget.storage),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final user = snapshot.data;
            return Container(
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
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                const Icon(Icons.account_circle, size: 60),
                                Text(user!.nom!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                                const Text(" ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                               Text(user.prenom!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),)

                              ],
                            )),
                            Align(alignment: Alignment.center,child:
                            Column(children: [
                              SizedBox(width: 60,),
                              Text("Nom d'utilisateur : " + user.clee!,  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40))
                            ],)),
                       
                        
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

Future<User> getLocalData(SharedPreferences storage) async {
  try {
    print(storage.getStringList('user'));
    User user = User.fromList(storage.getStringList('user')!);
    print(user);

    return user;
  } catch (e) {
    throw Exception("perdu connard !!");
  }
}
