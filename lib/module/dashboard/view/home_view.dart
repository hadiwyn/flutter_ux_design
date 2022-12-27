import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ux_design/core.dart';
import '../controller/dashboard_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var db = FirebaseFirestore.instance;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text("Add Data"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      final user = <String, dynamic>{
                        "first": "Alan",
                        "middle": "Mathison",
                        "last": "Turing",
                        "born": 1912
                      };

// Add a new document with a generated ID
                      db.collection("users").add(user).then((DocumentReference
                              doc) =>
                          print('DocumentSnapshot added with ID: ${doc.id}'));
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text("Read Data"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () async {
                      await db.collection("users").get().then((event) {
                        for (var doc in event.docs) {
                          print("${doc.id} => ${doc.data()}");
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
