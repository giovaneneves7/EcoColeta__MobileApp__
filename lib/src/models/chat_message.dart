import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.message, required this.isUser});

  final String message;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 160.0),
      child: Row(
        mainAxisAlignment: this.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          this.isUser ? Container() : CircleAvatar(child: Icon(Icons.person),),
          const SizedBox(height: 8.0),
          Column(
            mainAxisAlignment: this.isUser? MainAxisAlignment.end : MainAxisAlignment.center,
            children: [
              Text(this.isUser ? "Você" : "Remetente", style: TextStyle(fontWeight: FontWeight.bold,),),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Text(this.message),
          ),
        ],
      ),
    );
  }
}
