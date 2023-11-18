import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photoshot/components/profilepic.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  double _screenSize(BuildContext context, double d) {
    return MediaQuery.of(context).size.width * d;
  }

  Widget navButtonItem(String icon, double iconsize) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Image.asset(icon, width: iconsize),
    );
  }

  Widget buildNavButton(String icon, double iconsize, dynamic onTap) {
    return InkWell(
      onTap: onTap,
      child: navButtonItem(icon, iconsize),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
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
              buildNavButton('assets/icons/home.png', 26, () {}),
              buildNavButton('assets/icons/search.png', 26, () {}),
              buildNavButton('assets/icons/camera.png', 26, () {}),
              buildNavButton('assets/icons/bookmark.png', 26, () {}),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8),
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
