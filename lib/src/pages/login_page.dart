import "package:flutter/material.dart";
import './morador/morador_home_page.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MoradorHomePage())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "entrar",
                        style: TextStyle(
                          color: Colors.white,
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
}
