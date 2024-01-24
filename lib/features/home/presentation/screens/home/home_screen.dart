import 'package:chatgpt_app/features/home/presentation/providers/bottom_navigation_bar/bottom_navigation_index_provider.dart';
import 'package:chatgpt_app/features/home/presentation/screens/screens.dart';
import 'package:chatgpt_app/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavigationIndexProvider);
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: const [
          SettingsView(),
          ChatView(),
          LinkedingView(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
