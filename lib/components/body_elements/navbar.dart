import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photoshot/components/profilepic.dart';

class NavBar extends StatefulWidget {
  final int? blurLevel;
  const NavBar({super.key, int? blurLevel}) : blurLevel = blurLevel ?? 30;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int activeIndex = 0;
  double _screenSize(BuildContext context, double d) {
    return MediaQuery.of(context).size.width * d;
  }

  Widget navButtonItem(String icon, double iconsize, bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive ? const Color(0x22888888) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            icon,
            width: iconsize,
          )),
    );
  }

  Widget buildNavButton(
      String icon, double iconsize, dynamic onTap, int index) {
    return InkWell(
      onTap: () {
        setState(() => activeIndex = index);
        onTap();
      },
      child: navButtonItem(icon, iconsize, index == activeIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    double blur = widget.blurLevel!.toDouble();
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          height: 60,
          width: _screenSize(context, 1),
          decoration: const BoxDecoration(
            color: Color(0xBBFFFFFF),
            border: Border(
              top: BorderSide(
                width: 1,
                color: Color(0xFFDDDDDD),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavButton('assets/icons/home.png', 26, () {}, 0),
              buildNavButton('assets/icons/search.png', 26, () {}, 1),
              buildNavButton('assets/icons/camera.png', 26, () {}, 2),
              buildNavButton('assets/icons/bookmark.png', 26, () {}, 3),
              InkWell(
                onTap: () {
                  setState(() => activeIndex = 4);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: ProfilePic(size: 26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
