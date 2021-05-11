import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/notifiers/favorite_notifier.dart';
import 'package:masakan_ala_anak_kos/notifiers/login_notifier.dart';
import 'package:masakan_ala_anak_kos/pages/about_page.dart';
import 'package:masakan_ala_anak_kos/pages/login_page.dart';
import 'package:masakan_ala_anak_kos/pages/main_page.dart';
import 'package:masakan_ala_anak_kos/notifiers/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
        ChangeNotifierProvider<LoginNotifier>(
          create: (_) => LoginNotifier(),
        ),
        ChangeNotifierProvider<FavoriteNotifier>(
          create: (_) => FavoriteNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().getTheme,
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        MainPage.route: (context) => MainPage(),
        AboutPage.route: (context) => AboutPage(),
      },
    );
  }
}
