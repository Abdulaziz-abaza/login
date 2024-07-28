import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/widget/theme_provider.dart';

void showThemeSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(S.of(context).theme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(Provider.of<ThemeProvider>(context).themeMode ==
                        ThemeMode.dark
                    ? 'Dark'
                    : 'Light'),
                trailing: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Switch(
                      value: themeProvider.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    );
                  },
                ),
              ),
            ],
          ));
    },
  );
}
