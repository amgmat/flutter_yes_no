import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
    Message(text: 'Hola amigo', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo', fromWho: FromWho.me),
    Message(text: 'otro mensaje', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {}
}
