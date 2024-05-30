import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';
import 'package:grocery_app/views/login_screen.dart';
import 'package:grocery_app/views/widgets/app_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image.asset(
            "assets/images/start.jpg",
            width: double.infinity,
            fit: BoxFit.cover,
          )),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cadastro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Digite o email e senha para entrar na plataforma",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    //   hintText: 'Email',
                    label: Text('Nome'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    //   hintText: 'Email',
                    label: Text('Email'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    //  hintText: 'Senha',
                    label: Text('Senha'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    "Ao continuar, você concorda com os nossos termos de serviço."),
              )
            ],
          ),
          Column(
            children: [
              AppButton(
                btnTitle: "Cadastrar",
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Já tem uma conta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
