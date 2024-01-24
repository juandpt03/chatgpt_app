import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_app/features/home/domain/domain.dart';
import 'package:chatgpt_app/features/home/presentation/providers/providers.dart';
import 'package:chatgpt_app/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

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
        actions: const [
          _IconInfo(),
          _IconClearchat(),
        ],
        elevation: 1,
      ),
      backgroundColor: colors.surface,
      body: Center(
        child: _ChatView(),
      ),
    );
  }
}

class _IconClearchat extends ConsumerWidget {
  const _IconClearchat();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isEmpty = ref.watch(messageProvider).isEmpty;

    return IconButton(
      icon: const Icon(Icons.delete_outline),
      onPressed: isEmpty
          ? null
          : () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('¿Estás seguro?'),
                  content: const Text(
                      '¿Estás seguro de que quieres borrar el chat?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.invalidate(messageProvider);

                        Navigator.pop(context);
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              );
            },
    );
  }
}

class _IconInfo extends StatelessWidget {
  const _IconInfo();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Información'),
              content: const Text(
                  'ChatDPT es un chatbot que te ayudará a resolver cualquiera de tus dudas\n\n©Juandpt '),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      },
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
          if (messageList.isEmpty)
            Image.asset(
              'assets/animations/hello.gif',
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              controller: messageNotifier.chatScrollController,
              itemBuilder: (context, index) {
                final Message message = messageList[index];
                return message.fromWho == FromWho.mine
                    ? FadeInUp(
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
