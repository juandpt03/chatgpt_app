import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  final void Function()? onPressed;

  const MessageFieldBox({
    super.key,
    required this.onValue,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    const underLineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      borderSide: BorderSide.none,
    );
    final inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      hintText: '¿Qué quisieras saber?',
      filled: true,
      border: underLineInputBorder,
      fillColor: colors.secondaryContainer,
      suffixIcon: IconButton(
        icon: Icon(
          Icons.send,
          color: colors.primary,
        ),
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isEmpty) return;
          focusNode.unfocus();
          textController.clear();
          onValue(textValue);
        },
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        if (value.isEmpty) return;
        textController.clear();
        focusNode.unfocus();
        onValue(value);
      },
    );
  }
}
