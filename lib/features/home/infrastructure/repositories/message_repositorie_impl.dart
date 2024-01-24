import 'package:chatgpt_app/features/home/domain/domain.dart';

class MessageRepositorieImpl extends MessageRepository {
  final MessageDataSource messageDataSource;

  MessageRepositorieImpl({required this.messageDataSource});

  @override
  Future<Message> getResponse(String prompt) async {
    return await messageDataSource.getResponse(prompt);
  }
}
