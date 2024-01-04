// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24), // acompanha + que o /n
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: TextButton(
                        onPressed: () {
                          print('Clicado');
                        },
                        child: const Text(
                          'CADASTRE-SE',
                          style: TextStyle(
                            fontFamily: 'Margem',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 105, 55),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(), // ocupa todo o espaço máx disponível vertical (column) ou horizontal (row)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Margem',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Acesse agora sua conta para acompanhar seus pedidos, ter ofertas exclusivas e muito mais.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Margem',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _borda(_emailController, 'Digite seu e-mail'),
                    const SizedBox(height: 20),
                    _borda(_senhaController, 'Digite sua senha',
                        essasenha: true),
                    const SizedBox(height: 20),
                    _criarBotaoEsqueciSenha(),
                    _criarBotao('ENTRAR', const Color.fromARGB(255, 0, 105, 55),
                        () {
                      print('Entrar Clicado');
                    }),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _borda(TextEditingController controller, String label,
      {bool essasenha = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: controller,
          obscureText: essasenha,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _criarBotaoEsqueciSenha() {
    return TextButton(
      onPressed: () {
        print('Clicado');
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'ESQUECI MINHA SENHA',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 105, 55),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _criarBotao(String label, Color cor, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: cor,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 150,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
