import 'package:flutter/material.dart';
import 'package:flutter_ux_design/state_util.dart';
import '../view/add_data_view.dart';

class AddDataController extends State<AddDataView> implements MvcController {
  static late AddDataController instance;
  late AddDataView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}