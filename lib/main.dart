import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/widget/locale_provider.dart';
import 'package:task1/widget/my_app.dart';
import 'package:task1/widget/theme_provider.dart';
import 'package:task1/widget/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MyApp(),
    ),
  );
}
