import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:photoshot/components/profilepic.dart';

class NavBar extends StatefulWidget {
  final int? blurLevel;
  final Function(int)? onTap;
  final int? activeIndex;
  NavBar({super.key, int? blurLevel, this.onTap, this.activeIndex})
      : blurLevel = blurLevel ?? 30;

  final List<String> listimages = [
    "https://plus.unsplash.com/premium_photo-1681996735353-df9e1e4085b9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTEzfHxwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1554844453-7ea2a562a6c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1589656966895-2f33e7653819?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1551737823-dfc8495904b4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1574870111867-089730e5a72b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YW5pbWFsc3xlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1607010063495-a18e40ec6ff3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzh8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1474511320723-9a56873867b5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGFuaW1hbHN8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1456926631375-92c8ce872def?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGFuaW1hbHN8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1500521680613-a8f77c5cd0f5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTF8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1481923387198-050ac1a2896e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTI4fHxwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1496551729338-fa0c71a2c950?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTQwfHxwaG90b2dyYXBoeXxlbnwwfHwwfHx8MA%3D%3D",
  ];

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int activeIndex = 0;
  double _screenSize(BuildContext context, double d) {
    return MediaQuery.of(context).size.width * d;
  }

  Widget navButtonItem(
      String? icon, double iconsize, bool isActive, Widget? profilepic) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive ? const Color(0x22888888) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: profilepic != null
              ? ProfilePic(size: iconsize.toInt())
              : Image.asset(
                  icon!,
                  width: iconsize,
                )),
    );
  }

  Widget buildNavButton(
      String? icon, double iconsize, int? index, Widget? profilepic) {
    return InkWell(
      onTap: () => widget.onTap!(index!),
      child: navButtonItem(
          icon, iconsize, index == widget.activeIndex, profilepic),
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
              // buildNavButton(icon?, size, index, profilepic?),
              buildNavButton('assets/icons/home.png', 26, 0, null),
              buildNavButton('assets/icons/search.png', 26, 1, null),
              buildNavButton('assets/icons/camera.png', 26, 2, null),
              buildNavButton('assets/icons/bookmark.png', 26, 3, null),
              buildNavButton(
                  null,
                  26,
                  4,
                  const ProfilePic(
                    size: 26,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
