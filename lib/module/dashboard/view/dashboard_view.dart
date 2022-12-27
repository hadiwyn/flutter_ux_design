import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ux_design/core.dart';
import 'package:flutter_ux_design/module/dashboard/view/home_view.dart';
import 'package:flutter_ux_design/module/dashboard/widget/MyBottomNavbar.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  Widget build(context, DashboardController controller) {
    controller.view = this;

    final _selectedIndexNotifier = ValueNotifier<int>(0);

    final _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _selectedIndexNotifier.value = index;
        },
        children: [HomeView(), ReportView()],
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndexNotifier: _selectedIndexNotifier,
        pageController: _pageController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddDataView();
          }));
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
