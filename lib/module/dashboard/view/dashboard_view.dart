import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../add_data/view/add_data_view.dart';
import '../../report/view/report_view.dart';
import '../controller/dashboard_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/MyBottomNavbar.dart';
import 'home_view.dart';

// ignore: must_be_immutable
class DashboardView extends StatefulWidget {
  var db = FirebaseFirestore.instance;

  DashboardView({super.key});

  @override
  State<DashboardView> createState() => DashboardController();

  Widget build(context, DashboardController controller) {
    controller.view = this;

    Future<FirebaseApp> _initializeFirebase() async {
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      return firebaseApp;
    }

    final _selectedIndexNotifier = ValueNotifier<int>(0);

    final _pageController = PageController();

    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _selectedIndexNotifier.value = index;
              },
              children: [
                Home(),
                ReportView(),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndexNotifier: _selectedIndexNotifier,
        pageController: _pageController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AddDataView());
          Navigator.of(context).push(route);
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
