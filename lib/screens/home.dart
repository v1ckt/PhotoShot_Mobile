import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/navbar.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/screens/currentscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;
  final List<Widget> telas = [
    const CurrentPage("FEED"),
    const CurrentPage("SEARCH"),
    const CurrentPage("BOOKMARKS"),
    const CurrentPage("PROFILE")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('home'),
      body: telas[indice],
      bottomNavigationBar: const NavBar(),
    );
  }
}
