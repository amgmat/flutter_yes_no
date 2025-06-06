import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola amigo', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo', fromWho: FromWho.me),
    Message(text: 'otro mensaje', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    if (text.endsWith('?')) {
      herReply();
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    notifyListeners();
    await moveScrollBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);
    notifyListeners();

    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
