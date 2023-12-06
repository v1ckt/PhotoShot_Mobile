import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photoshot/components/buttons.dart';
import 'package:photoshot/components/textfield.dart';
import 'package:photoshot/components/logo.dart';
import 'package:photoshot/screens/homeApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const MyHomePage(title: 'Login'),
      // home: SearchPage(),
      // home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double screenSize(double d) {
    return MediaQuery.of(context).size.width * d;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        //Tudo
        child: Center(
          //Todos centralizados
          child: Column(
            // Topo à base
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              const Logo(size: 40),
              Column(
                // Formulário
                children: [
                  // Container do centro
                  SizedBox(
                    // width: screenSize(0.7),
                    child: Column(
                      // Entradas de texto
                      children: [
                        PrimaryInput(
                            title: 'Usuário',
                            pass: false,
                            width: screenSize(0.7)),
                        const SizedBox(height: 15),
                        Column(
                          // Input de Senha + Recuperação
                          children: [
                            PrimaryInput(
                                title: 'Senha',
                                pass: true,
                                width: screenSize(0.7)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              // Texto e espaçamento
                              children: [
                                const SizedBox(width: 130),
                                SizedBox(
                                  height: 35,
                                  child: InkWell(
                                    onTap: () {},
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    child: Text(
                                      'Esqueceu a senha?',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PrimaryBtn(
                      title: 'ENTRAR',
                      btnwidth: screenSize(0.7),
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      }),
                ],
              ),
              Column(
                // Entrar com...
                children: [
                  const Text('Entrar com'),
                  Row(
                    // Ícones
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/fb.png', width: 50),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/gg.png', width: 50),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/appl.png', width: 50),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                // Rodapé
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não tem uma conta?'),
                      InkWell(
                        onTap: () {},
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        child: const Text(
                          ' Criar conta',
                          style: TextStyle(
                            color: Color(0xFF5200FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
