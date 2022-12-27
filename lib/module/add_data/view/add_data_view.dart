import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../controller/add_data_controller.dart';

class AddDataView extends StatefulWidget {
  var db = FirebaseFirestore.instance;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  TextEditingController nama_barangC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();
  TextEditingController nama_penemuC = TextEditingController();
  TextEditingController noTlpC = TextEditingController();
  TextEditingController keyC = TextEditingController();

  Widget build(context, AddDataController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AddData"),
        actions: const [],
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [judul(), content()],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget judul() {
    return Container(
      alignment: Alignment.center,
      height: 75,
      child: Text(
        'Tambah Aduan',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget content() {
    return PhysicalModel(
        color: Colors.white,
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: 550,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: nama_barangC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Nama Barang',
                ),
              ),
              TextFormField(
                controller: nama_penemuC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Nama Penemu',
                ),
              ),
              TextFormField(
                controller: noTlpC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Nomor Telepon',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Foto',
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Upload Foto')),
              TextFormField(
                controller: deskripsiC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Deskripsi',
                ),
              ),
              TextFormField(
                controller: keyC,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Kunci Penghapusan',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        final user = <String, dynamic>{
                          "nama_barang": "Jam Tangan",
                          "nama_penemu": "Yusup",
                          "nomor_telepon": "082237422743",
                          "deskripsi": "barang Hilang",
                          "key": "aku sayang ibu"
                        };

// Add a new document with a generated ID
                        db.collection("Barang_Hilang").add(user).then(
                            (DocumentReference doc) => print(
                                'DocumentSnapshot added with ID: ${doc.id}'));
                      },
                      child: Text('Tambah')),
                ],
              )
            ],
          ),
        ));
  }

  @override
  State<AddDataView> createState() => AddDataController();
}
