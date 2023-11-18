import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final int size;
  const Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment(0.95, -0.31),
        end: Alignment(-0.95, 0.31),
        colors: [Color(0xFF0400D6), Color(0xFFFF00E5)],
      ).createShader(bounds),
      child: Text(
        'PHOTOSHOT',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size.toDouble(),
          fontFamily: 'Viga',
          fontWeight: FontWeight.w400,
          height: 0,
          letterSpacing: 0.80,
          color: Colors.white,
        ),
      ),
    );
  }
}
