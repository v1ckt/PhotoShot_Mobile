import 'package:flutter/material.dart';

class ProfileInfoBtn extends StatefulWidget {
  final String? icon;
  final String? text;
  final dynamic ontap;
  final Color? color;

  const ProfileInfoBtn({Key? key, String? text, this.ontap, Color? color, this.icon})
      : text = text ?? 'ButtonTitle',
        color = color ?? const Color(0xFF555555),
        super(key: key);

  @override
  _ProfileInfoBtnState createState() => _ProfileInfoBtnState();
}

class _ProfileInfoBtnState extends State<ProfileInfoBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              widget.text!,
              style: TextStyle(fontSize: 20, color: widget.color),
            ),
          ],
        ),
      ),
    );
  }
}