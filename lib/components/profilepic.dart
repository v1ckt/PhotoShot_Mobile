import 'package:flutter/material.dart';

class ProfilePic extends StatefulWidget {
  final Map<String, dynamic>? userdata;
  final int size;
  const ProfilePic({
    Key? key,
    Map<String, dynamic>? userdata,
    int? size,
  })  : userdata = userdata ?? const {'name': 'João', 'profilepic': null},
        size = size ?? 32,
        super(key: key);

  @override
  State<ProfilePic> createState() => Default();
}

class Default extends State<ProfilePic> {
  double size() {
    return widget.size.toDouble();
  }

  profileEmpty() {
    if (widget.userdata!['profilepic'] == null) {
      return [const AssetImage('assets/icons/profilepic.png'), size(),Container()];
    } else {
      return [
        NetworkImage(widget.userdata!['profilepic']), size() - 2,
        Container(
          alignment: Alignment.center,
          width: size() + 1,
          height: size() + 1,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFFFF00E5), Color(0xFF0400D7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      profileEmpty().last,
      Container(
        alignment: Alignment.center,
        width: profileEmpty().elementAt(1),
        height: profileEmpty().elementAt(1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: profileEmpty().first,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ]);
  }
}
