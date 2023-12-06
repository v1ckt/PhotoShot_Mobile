// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/navbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';
import 'package:photoshot/screens/searchcontent.dart';
import 'package:photoshot/screens/homecontent.dart';
import 'package:photoshot/screens/profilecontent.dart';

class HomePage extends StatefulWidget {
  // construtor
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _pageIndexNotifier = ValueNotifier<int>(0);
  final List<Widget> _pages = [
    HomeContent(),
    SearchPage(),
    Container(),
    const Text('SAVED'),
    ProfilePage(),
  ];

  void _onItemTaped(int index) {
    if (index == 2) {
      showModalBottomSheet(
        context: context,
        builder: (context) => const SizedBox(
          height: 100,
          child: Center(
            child: Text('ButtonOption'),
          ),
        ),
      );
    } else {
      _pageIndexNotifier.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _pageIndexNotifier,
        builder: (context, pageIndex, child) {
          return IndexedStack(
            index: pageIndex,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _pageIndexNotifier,
        builder: (context, pageIndex, child) {
          return NavBar(
            onTap: _onItemTaped,
            activeIndex: pageIndex,
          );
        },
      ),
    );
  }
}
