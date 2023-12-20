import 'package:photoshot/components/buttons.dart';
import 'package:photoshot/components/textfield.dart';
import 'package:photoshot/components/logo.dart';
import 'package:photoshot/autentication.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenSize(double d) {
      return MediaQuery.of(context).size.width * d;
    }

    buildSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }

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
                            controller: emailController,
                            title: 'E-mail',
                            pass: false,
                            width: screenSize(0.7)),
                        const SizedBox(height: 15),
                        Column(
                          // Input de Senha + Recuperação
                          children: [
                            PrimaryInput(
                                controller: passwordController,
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
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          signIn(emailController.text, passwordController.text)
                              .then((result) {
                            if (result != null) {
                              Navigator.pushNamed(context, '/home');
                            } else {
                              buildSnackBar('Email ou senha inválidos');
                            }
                          });
                        } else {
                          buildSnackBar('Preencha todos os campos');
                        }
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
