import 'package:chatgpt_app/features/home/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final index = ref.watch(bottomNavigationIndexProvider);
    final indexNotifier = ref.watch(bottomNavigationIndexProvider.notifier);
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      unselectedItemColor: colors.secondary,
      currentIndex: index,
      onTap: (int index) {
        indexNotifier.update((state) => state = index);
      },
      selectedItemColor: colors.primary,
      selectedIconTheme: const IconThemeData(size: 30),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userGear),
          label: 'Tema',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userAstronaut),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.linkedin),
          label: 'Perfil',
        ),
      ],
    );
  }
}
