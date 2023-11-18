import 'package:flutter/material.dart';

class CurrentPage extends StatelessWidget {
    final String texto;

  const CurrentPage(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(texto),
    );
  }
}