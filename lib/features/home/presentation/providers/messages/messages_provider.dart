import 'package:chatgpt_app/features/home/domain/domain.dart';
import 'package:chatgpt_app/features/home/infrastructure/infrastructure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoyProvider = StateProvider<MessageRepository>((ref) {
  return MessageRepositorieImpl(messageDataSource: ChatGPTDataSource());
});

final messageProvider =
    StateNotifierProvider<MessageNotifier, List<Message>>((ref) {
  return MessageNotifier(messageRepository: ref.watch(repositoyProvider));
});

class MessageNotifier extends StateNotifier<List<Message>> {
  final MessageRepository messageRepository;
  final ScrollController chatScrollController = ScrollController();
  bool loading = false;

  MessageNotifier({required this.messageRepository}) : super([]);

  Future<void> getResponse(String prompt) async {
    loading = true;
    final response = await messageRepository.getResponse(prompt);
    final Message myMessage = Message(
      text: prompt,
      fromWho: FromWho.mine,
    );
    state = [...state, myMessage, response];
    loading = false;
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
  }
}
