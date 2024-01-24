//StateNotifierProvider
import 'package:chatgpt_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  Future<void> toggleDarkMode() async {
    state = state.copyWith(
      isDark: !state.isDark,
    );
  }
}
