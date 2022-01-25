import 'package:flutter/material.dart';
import 'package:flutter_adamlabs_test2/screen/home/components/app_bar.dart';
import 'package:flutter_adamlabs_test2/screen/home/components/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: homeAppBar(context, _scaffoldKey),
      drawer: HomeDrawer(),
    );
  }
}
