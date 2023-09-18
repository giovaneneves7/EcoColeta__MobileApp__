import 'package:flutter/material.dart';

class MoradorDrawer extends StatelessWidget {
  const MoradorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(

            // ==== [ Lista de items do Drawer ] ==== //
            children: [

              // === [ Item 'Minha Conta' ] === //
              Container(
                padding: const EdgeInsets.only(top: 15.0),

                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Text("Minha conta"),
                      ],
                    ),
                  ),
                ),
              ),

              // === [ Item 'Sair' ] === //
              Container(
                padding: const EdgeInsets.only(top: 15.0),

                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Text("Sair"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
