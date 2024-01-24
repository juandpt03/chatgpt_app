import 'package:chatgpt_app/features/home/domain/domain.dart';
import 'package:flutter/material.dart';

class HerMessage extends StatelessWidget {
  final Message message;

  const HerMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          child: Image.asset('assets/images/logo/her.png'),
        ),
        _Message(message: message),
      ],
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: color.secondary,
        );
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: color.secondaryContainer,
                width: 1,
              ),
              color: color.secondaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(message.text, style: textStyle),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
