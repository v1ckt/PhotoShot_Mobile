import 'package:flutter/material.dart';
import 'package:photoshot/components/body_elements/topbar.dart';
import 'package:photoshot/components/body_elements/customscaffold.dart';
import 'package:photoshot/components/resultsitem.dart';

class ProfilePage extends StatefulWidget {
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

  ProfilePage({super.key});

  @override
  _ProfilePAgeState createState() => _ProfilePAgeState();
}

class _ProfilePAgeState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset >= 1) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: PreferredSize(
          preferredSize: Size.copy(_isScrolled
              ? Size(double.infinity, 120)
              : Size(double.infinity, 300)),
          child: buildAppBar(
            topBar: TopBar(
              state: !_isScrolled ? 'profile' : 'profilecollapsed',
              isMy: true,
            ),
          ),
        ),
        body: ResultList(
            imgList: widget.listimages, scrollController: _scrollController));
  }
}
