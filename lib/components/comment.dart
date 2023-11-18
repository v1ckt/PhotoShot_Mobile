import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String comment, username;

  const Comment({Key? key, required this.comment, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('@$username:', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Text(comment, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        ],
      ),
    );
  }
}
