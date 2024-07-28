import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/widget/locale_provider.dart';
import 'package:task1/widget/theme_provider.dart';

void showLanguageSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).settings),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(S.of(context).language),
              trailing: DropdownButton<Locale>(
                value: Provider.of<LocaleProvider>(context).locale,
                onChanged: (Locale? locale) {
                  Provider.of<LocaleProvider>(context, listen: false)
                      .setLocale(locale!);
                  Navigator.pop(context);
                },
                items: S.delegate.supportedLocales
                    .map((locale) => DropdownMenuItem(
                          child: Text(locale.languageCode == 'ar'
                              ? 'Arabic'
                              : locale.languageCode == 'en'
                                  ? 'English'
                                  : 'Turkish'),
                          value: locale,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    },
  );
}
