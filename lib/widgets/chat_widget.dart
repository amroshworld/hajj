import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String userName;

  const ChatWidget({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $userName'),
      ),
      body: Center(
        child: Text(
          'Chatting with $userName',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}