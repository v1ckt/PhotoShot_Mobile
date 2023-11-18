import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  final String title;
  final bool pass;
  final dynamic width, height, icone, color, fontcolor;
  final double? textsize;

  const PrimaryInput(
      {super.key,
      required this.title,
      required this.pass,
      width,
      double? textsize,
      color,
      height,
      fontcolor,
      this.icone})
      : width = width ?? 300,
        height = height ?? 50,
        textsize = textsize ?? 20,
        color = color ?? const Color(0xFFF5F5F5),
        fontcolor = fontcolor ?? const Color(0xFFBDBDBD);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      width: width.toDouble(),
      height: height.toDouble(),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: pass,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: textsize,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15),
          suffixIcon: Icon(
            icone,
            color: fontcolor,
            size: 30,
          ),
          alignLabelWithHint: true,
          border: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            color: fontcolor,
            fontSize: textsize,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}
