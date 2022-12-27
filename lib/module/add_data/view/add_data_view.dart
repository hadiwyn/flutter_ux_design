import 'dart:ui';

import 'package:flutter/material.dart';
import '../controller/add_data_controller.dart';

class AddDataView extends StatefulWidget {
  const AddDataView({Key? key}) : super(key: key);

  Widget build(context, AddDataController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AddData"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [judul(), content()],
          ),
        ),
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
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Upload Foto')),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Tambah')),
                  ElevatedButton(onPressed: () {}, child: Text('Batal')),
                ],
              )
            ],
          ),
        ));
  }

  @override
  State<AddDataView> createState() => AddDataController();
}
