import 'package:flutter/material.dart';

class ChatBubbol extends StatelessWidget {
  final String message;

  const ChatBubbol({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Text(
        message,
        style: const TextStyle(
            fontSize: 16, color: Color.fromARGB(255, 32, 32, 32)),
      ),
    );
  }
}
