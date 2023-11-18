import 'package:flutter/material.dart';
import 'package:photoshot/components/feedcard.dart';
import 'package:photoshot/components/body_elements/navbar.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';

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
    final Map<String, dynamic> user01 = {
      'name': 'João',
      'profilepic': listimages[0],
      'photo': listimages[7],
    };
    final Map<String, dynamic> user02 = {
      'name': 'João',
      'profilepic': listimages[0],
      'photo': listimages[4],
    };

    return CustomScaffold(
        appBar: buildAppBar('search'),
        body: ListView(
          padding: const EdgeInsets.only(top: 80, bottom: 50),
          children: [
            const Padding(padding: EdgeInsets.only(top: 60)),
            // BODY
            Feedcard(userdata: user02),
            Feedcard(userdata: user02),
            Feedcard(userdata: user02),
          ],
        ),
        bottomNavigationBar: const NavBar()
        );
  }
}
