import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String? icon;
  final String? text;
  final dynamic ontap;
  final Color? color;

  const SettingsItem(
      {Key? key, required this.icon, String? text, this.ontap, Color? color})
      : text = text ?? 'Settings Item',
        color = color ?? const Color(0xFF555555),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
        child: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            icon!,
            width: 30,
            color: color,
          ),
          const SizedBox(width: 20),
          Text(
            text!,
            style: TextStyle(fontSize: 20, color: color),
          ),
        ],
      ),
    ));
  }
}
