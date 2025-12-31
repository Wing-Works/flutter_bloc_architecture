import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/l10n/generated/l10n.dart';
import 'package:flutter_bloc_architecture/src/my_app/cubit/theme_cubit.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({
    super.key,
    this.showLabel = false,
    this.lightIcon,
    this.darkIcon,
  });

  final bool showLabel;
  final IconData? lightIcon;
  final IconData? darkIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        final themeCubit = context.read<ThemeCubit>();
        final s = AppLocalizations.of(context);

        return showLabel
            ? SwitchListTile(
                title: Text(
                  isDark ? s.darkMode : s.lightMode,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                secondary: Icon(
                  isDark
                      ? (darkIcon ?? Icons.dark_mode)
                      : (lightIcon ?? Icons.light_mode),
                ),
                value: isDark,
                onChanged: (_) => themeCubit.toggleTheme(),
              )
            : IconButton(
                icon: Icon(
                  isDark
                      ? (darkIcon ?? Icons.dark_mode)
                      : (lightIcon ?? Icons.light_mode),
                  color: Theme.of(context).cardColor,
                ),
                onPressed: themeCubit.toggleTheme,
                tooltip: isDark ? s.switchToLightMode : s.switchToDarkMode,
              );
      },
    );
  }
}
