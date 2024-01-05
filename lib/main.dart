// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _essasenha = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
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
              const Spacer(),
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
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'Acesse agora sua conta para acompanhar seus pedidos, ter ofertas exclusivas e muito mais.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Margem',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _bordaEmail(_emailController, 'Digite seu e-mail'),
                  const SizedBox(height: 20),
                  _bordaSenha(_senhaController, 'Digite sua senha'),
                  const SizedBox(height: 20),
                  _criarBotaoEsqueciSenha(),
                  const SizedBox(height: 20),
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
    );
  }

  Widget _bordaEmail(TextEditingController controller, String label) {
    return _bordaa(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _bordaSenha(TextEditingController controller, String label) {
    return _bordaa(
      child: TextField(
        controller: controller,
        obscureText: _essasenha,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(_essasenha ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _essasenha = !_essasenha;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _bordaa({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: child,
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

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}

//achar quem define a quantidade de linhas
//criar pasta assets, criar pasta pra fontes e adicionar a pasta no pubspec yaml