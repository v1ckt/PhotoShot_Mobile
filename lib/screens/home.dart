import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/navbar.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/screens/currentscreen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;
  final List<Widget> telas = [
    CurrentPage("FEED"),
    CurrentPage("SEARCH"),
    CurrentPage("BOOKMARKS"),
    CurrentPage("PROFILE")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('home'),
      body: telas[indice],
      bottomNavigationBar: NavBar(),
    );
  }
}
