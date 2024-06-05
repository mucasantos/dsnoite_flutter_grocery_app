import 'package:flutter/material.dart';
import 'package:grocery_app/services/app_constants.dart';
import 'package:grocery_app/services/http_manager.dart';
import 'package:grocery_app/views/login_screen.dart';
import 'package:grocery_app/views/widgets/app_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool signupError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/start.jpg",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        //   hintText: 'Email',
                        label: Text('Nome'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        //  hintText: 'Senha',
                        label: Text('Cidade'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: stateController,
                      decoration: const InputDecoration(
                        //  hintText: 'Senha',
                        label: Text('Estado'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        //  hintText: 'Senha',
                        label: Text('Telefone'),
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
                    onPressed: () async {
                      try {
                        var userSignupData = await HTTPManager().userSignup(
                          email: emailController.text,
                          password: passController.text,
                          name: nameController.text,
                          state: stateController.text,
                          city: cityController.text,
                          phone: phoneController.text,
                        );
                        print("On View");

                        print(userSignupData['data']);
                      } catch (e) {
                        setState(() {
                          signupError = true;
                        });
                        print("Error LOG TRY==>");
                        print(e);
                        print("Error LOG TRY==>");
                      }
                    },
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
        ),
      ),
    );
  }
}
