import 'package:flutter/material.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 64.0,
                          child: Icon(
                            Icons.person,
                            size: 100.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Flexible(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text("Nome"),
                        subtitle: Text("Username"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Telefone"),
                        subtitle: Text("74999999999"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("Email"),
                        subtitle: Text("giovane@example.com"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text("CPF"),
                        subtitle: Text("123.456.789-00"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ]
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
