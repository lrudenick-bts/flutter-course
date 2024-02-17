import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Simple boolean
final isDarkModeProvider = StateProvider((ref) => false);

// Immutable color list
final colorListProvider = Provider((ref) => colorList);

// Simple int
final selectedColorProvider = StateProvider((ref) => 0);

// An AppTheme object (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller or notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // State
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
