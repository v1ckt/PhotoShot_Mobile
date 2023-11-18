import 'package:flutter/material.dart';

class CurrentPage extends StatelessWidget {
    final String texto;

  CurrentPage(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}