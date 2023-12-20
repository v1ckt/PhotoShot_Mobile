import 'package:flutter/material.dart';
import 'package:photoshot/screens/homeApp.dart';
import 'package:photoshot/screens/login.dart';
import 'package:photoshot/screens/settings.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photoshot Login',
      theme: ThemeData(
        textTheme: const TextTheme(),
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
        fontFamily: 'Viga',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) {
          if (FirebaseAuth.instance.currentUser != null) {
            return HomePage(id: FirebaseAuth.instance.currentUser!.uid);
          } else {
            return const SnackBar(content: Text('Usuário não logado'));
          }
        },
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
