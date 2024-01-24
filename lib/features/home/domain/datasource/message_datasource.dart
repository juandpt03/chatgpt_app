import 'package:chatgpt_app/features/home/domain/domain.dart';

abstract class MessageDataSource {
  Future<Message> getResponse(String prompt);
}
