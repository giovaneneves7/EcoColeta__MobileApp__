import 'package:flutter/material.dart';

class UserSettingsPage extends StatelessWidget {

  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Configurações", style: TextStyle(fontSize: 30.0),),
              Flexible(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.add_alert),
                      title: Text('Notificações'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Ação ao tocar no ListTile
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Privacidade'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Ação ao tocar no ListTile
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Avaliação e Feeback'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Ação ao tocar no ListTile
                      },
                    )
                  ]
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Encerrar Sessão"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
