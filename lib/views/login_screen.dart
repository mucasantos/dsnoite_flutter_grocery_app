import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery_app/services/http_manager.dart';
import 'package:grocery_app/views/navigation_screen.dart';
import 'package:grocery_app/views/signup_screen.dart';
import 'package:grocery_app/views/widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool loginError = false;
  String textError = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image.asset(
            "assets/images/start.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
          )),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Digite o email e senha para entrar na plataforma",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
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
                  controller: emailController,
                  decoration: const InputDecoration(
                    //   hintText: 'Email',
                    label: Text('Email'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(
                    //  hintText: 'Senha',
                    label: Text('Senha'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text("Esqueceu a senha?")),
                ],
              )
            ],
          ),
          if (loginError)
            Center(
              child: Text(
                textError,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Column(
            children: [
              AppButton(onPressed: () async {
                var userLoginData = await HTTPManager()
                    .userLogin(emailController.text, passController.text);

                if (userLoginData['error'] != null) {
                  setState(() {
                    loginError = true;
                    textError = userLoginData['error'];
                  });
                  log(userLoginData['error']);
                } else {
                  if (!context.mounted) {
                    return;
                  }
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const NavigationScreen(),
                    ),
                  );
                  setState(() {
                    loginError = true;
                  });
                }
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tem uma conta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text("Cadastro"))
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
