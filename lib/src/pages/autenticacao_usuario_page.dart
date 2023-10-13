import 'package:flutter/material.dart';
import 'package:ecocoleta/src/pages/codigo_confirmacao_page.dart';

class AutenticacaoUsuarioPage extends StatefulWidget {
  const AutenticacaoUsuarioPage({super.key});

  @override
  State<AutenticacaoUsuarioPage> createState() => _AutenticacaoUsuarioPageState();
}

class _AutenticacaoUsuarioPageState extends State<AutenticacaoUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Text(
                      "Autenticação de Usuário",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.green[700],
                      ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      labelText: "digite o seu cpf",
                      hintText:
                      "digite apenas os número do cpf",
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      labelText: "digite o seu número do celular",
                      hintText:
                      "digite apenas os número do celular",
                      prefixIcon: const Icon(Icons.phone),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CodigoConfirmacaoPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "continuar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
