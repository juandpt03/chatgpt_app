import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkedingView extends StatelessWidget {
  const LinkedingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(colors.background)
      ..loadRequest(Uri.parse('https://github.com/juandpt03'));

    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
