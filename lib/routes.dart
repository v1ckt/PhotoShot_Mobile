import 'package:flutter/material.dart';

class MyRoutes extends StatelessWidget {
  const MyRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photoshot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
    );
  }
}