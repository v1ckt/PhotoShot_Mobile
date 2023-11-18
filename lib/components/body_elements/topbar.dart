import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:photoshot/components/textfield.dart';
import 'package:photoshot/components/logo.dart';
import 'package:photoshot/components/scrollablefilter.dart';

class TopBar extends StatefulWidget {
  final String state;
  const TopBar({Key? key, required this.state}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State<TopBar> {
  List<String> filterList = [
    'Paisagem',
    'Retrato',
    'Animais',
    'Natureza',
    'Urbana',
    'Gestante',
  ];
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (widget.state) {
      case 'home':
        child = const Logo(size: 26);
        break;
      case 'search':
        child = Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const PrimaryInput(
                title: 'O que você está buscando?',
                pass: false,
                width: double.infinity,
                icone: Icons.search,
                color: Color(0x22888888),
                fontcolor: Color(0xFF999999),
              ),
              ScrollableFilter(
                itemsCount: filterList.length,
                items: filterList,
              ),
            ],
          ),
          // ELEMENTO DE BAIXO
        );
        break;
      default:
        child = const Text('Erro');
    }

    return Material(
        elevation: 10,
        color: Colors.transparent,
        shadowColor: const Color(0x55000000),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xBBFFFFFF),
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
              child: SafeArea(child: child),
            ),
          ),
        ));
  }
}

AppBar buildAppBar(String state) {
  return AppBar(
    toolbarHeight: state == 'search' ? 120 : 60,
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: const Color(0x00FFFFFF),
    elevation: 0,
    flexibleSpace: TopBar(state: state),
  );
}