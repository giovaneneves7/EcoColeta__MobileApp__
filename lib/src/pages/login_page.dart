import 'dart:convert';

import "package:flutter/material.dart";
import './morador/morador_home_page.dart';
import './catador/catador_home_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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

    final data = await getUsers();

    return data["tipo"] == "catador" ? true : false;

  }

  Future<dynamic> getUsers() async{

    String url = "https://ecocoleta.free.beeceptor.com/users";

    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      print("Response: $response");
      final responseBody = json.decode(response.body);
      print("ResponseBody: $responseBody");

      return responseBody;

    }

  }

}
