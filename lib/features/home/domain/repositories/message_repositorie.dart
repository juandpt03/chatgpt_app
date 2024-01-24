import 'package:chatgpt_app/features/home/domain/domain.dart';

abstract class MessageRepository {
  Future<Message> getResponse(String prompt);
}
