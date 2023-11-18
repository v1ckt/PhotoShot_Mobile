import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/navbar.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';
import 'package:photoshot/components/resultsitem.dart';

class SearchPage extends StatelessWidget {
  final List<String> listimages = [
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/id/238/200/300',
    'https://picsum.photos/id/240/200/300',
    'https://picsum.photos/id/241/200/300',
    'https://picsum.photos/id/242/200/300',
    'https://picsum.photos/id/243/200/300',
    'https://picsum.photos/id/244/200/300',
    'https://github.com/samdutton/simpl/blob/gh-pages/bigimage/bigImage-20MB.jpg?raw=true',
  ];

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: buildAppBar('search'),
        body: ResultList(imgList: listimages),
        bottomNavigationBar: const NavBar());
  }
}
