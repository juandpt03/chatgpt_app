import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

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
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      hintText: '¿Qué quieres preguntar?',
      filled: true,
      border: underLineInputBorder,
      fillColor: colors.secondaryContainer,
      prefixIcon: IconButton(
        icon: Icon(
          FontAwesomeIcons.microphone,
          size: 20,
          color: colors.primary,
        ),
        onPressed: () {},
      ),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.send,
          color: colors.primary,
        ),
        onPressed: () {
          final textValue = textController.value.text;
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
        textController.clear();
        focusNode.unfocus();
        onValue(value);
      },
    );
  }
}
