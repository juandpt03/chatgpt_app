import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final String message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        _Message(message: message),
        CircleAvatar(
          radius: 15,
          backgroundColor: colors.primaryContainer,
          child: Image.asset(
            'assets/images/logo/me.png',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}

class _Message extends StatelessWidget {
  final String message;
  const _Message({required this.message});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: color.onPrimary,
        );
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: color.primaryContainer,
                width: 1,
              ),
              color: color.primary,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  color.primary,
                  color.tertiary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(message, style: textStyle),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
