import 'package:chatgpt_app/features/home/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeProvider).isDark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          _ChangeDarkTheme(isDarkMode: isDarkMode),
        ],
        title: const Text(
          'Configuraciones',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardSection(
            onTap: ref.read(themeProvider.notifier).toggleDarkMode,
            title: 'Cambiar Tema',
            icon: isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        ],
      ),
    );
  }
}

class _CardSection extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String title;
  const _CardSection({
    this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: const RoundedRectangleBorder(),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        title: Text(
          title,
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          icon,
          color: colors.primary,
        ),
      ),
    );
  }
}

class _ChangeDarkTheme extends ConsumerWidget {
  const _ChangeDarkTheme({
    required this.isDarkMode,
  });

  final bool? isDarkMode;

  @override
  Widget build(BuildContext context, ref) {
    return IconButton(
        onPressed: () {
          ref.read(themeProvider.notifier).toggleDarkMode();
        },
        icon: isDarkMode!
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode));
  }
}
