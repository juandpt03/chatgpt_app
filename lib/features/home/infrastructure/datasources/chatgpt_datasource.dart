import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatgpt_app/config/config.dart';
import 'package:chatgpt_app/features/home/domain/domain.dart';

class ChatGPTDataSource extends MessageDataSource {
  final openAI = OpenAI.instance.build(
    token: Enviroment.chatGptApiKey,
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
    enableLog: true,
  );

  @override
  Future<Message> getResponse(String prompt) async {
    final request = ChatCompleteText(
      messages: [Messages(role: Role.user, content: prompt)],
      maxToken: 200,
      model: GptTurboChatModel(),
    );

    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      try {
        Message message = Message(
          text: element.message?.content ?? '',
          fromWho: element.message?.role == Role.user.name
              ? FromWho.mine
              : FromWho.hers,
        );
        return message;
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    throw Exception('No response');
  }
}
