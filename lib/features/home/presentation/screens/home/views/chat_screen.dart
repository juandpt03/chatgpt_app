import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_app/features/home/domain/domain.dart';
import 'package:chatgpt_app/features/home/presentation/providers/providers.dart';
import 'package:chatgpt_app/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: colors.primary,
        );
    final subTextStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          color: colors.secondary,
        );

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo/logo.png'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ChatDPT 3.5', style: textStyle),
            Text('¡Tú chat de confianza!', style: subTextStyle),
          ],
        ),
        elevation: 1,
      ),
      backgroundColor: colors.surface,
      body: Center(
        child: _ChatView(),
      ),
    );
  }
}

class _ChatView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageList = ref.watch(messageProvider);
    final messageNotifier = ref.watch(messageProvider.notifier);

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              controller: messageNotifier.chatScrollController,
              itemBuilder: (context, index) {
                final Message message = messageList[index];
                return message.fromWho == FromWho.mine
                    ? BounceInUp(
                        child: MyMessageBubble(
                          message: message.text,
                        ),
                      )
                    : FadeInUp(
                        delay: const Duration(milliseconds: 100),
                        child: HerMessage(
                          message: message,
                        ),
                      );
              },
              itemCount: messageList.length,
            ),
          ),
          MessageFieldBox(
            onValue: (value) async {
              await messageNotifier.getResponse(value);
            },
          ),
        ],
      ),
    );
  }
}
