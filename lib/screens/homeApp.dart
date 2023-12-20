// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/navbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';
import 'package:photoshot/screens/searchcontent.dart';
import 'package:photoshot/screens/homecontent.dart';
import 'package:photoshot/screens/myprofilecontent.dart';

class HomePage extends StatefulWidget {
  final String id;
  // construtor
  HomePage({super.key, required this.id});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _pageIndexNotifier = ValueNotifier<int>(0);
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
    HomeContent(id: widget.id),
    SearchPage(),
    Container(),
    const Text('SAVED'),
    MyProfilePage(),
  ];
  }

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
