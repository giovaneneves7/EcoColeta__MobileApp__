import "package:flutter/material.dart";
import './morador/morador_home_page.dart';
import './catador/catador_home_page.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  
  Map<String, List<String>> users = {
    "example@gmail.com" : ["example123", "catador"],
    "sample@gmail.com" : ["sample123", "morador"],
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ===== [ Logo do EcoColeta ] ====== //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),

                // ===== [ Campo de Texto do e-mail ] ====== //
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: "e-mail",
                        hintText:
                            "insira um endereço de e-mail válido como example@gmail.com",
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                  ),
                ),

                // ===== [ Campo de Texto da senha ] ====== //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      labelText: "senha",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                    ),
                  ),
                ),

                // ===== [ Botão 'entrar' ] ====== //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {

                      login(emailController.text, passwordController.text,).then((isCatador) {

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => (isCatador ? CatadorHomePage() : MoradorHomePage()))
                        );

                      });

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "entrar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> login(final email, final password) async {

    return email == "example@gmail.com" ? true : false;

  }

}
