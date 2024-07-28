import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/login/loginview.dart';
import 'package:task1/widget/locale_provider.dart';
import 'package:task1/widget/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LocaleProvider>(
      builder: (context, themeProvider, localeProvider, child) {
        return Directionality(
          textDirection: localeProvider.locale?.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: localeProvider.locale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode,
            home: LoginView(),
          ),
        );
      },
    );
  }
}
