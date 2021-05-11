import 'package:flutter/material.dart';
import 'package:masakan_ala_anak_kos/notifiers/login_notifier.dart';
import 'package:masakan_ala_anak_kos/pages/about_page.dart';
import 'package:masakan_ala_anak_kos/pages/login_page.dart';
import 'package:masakan_ala_anak_kos/notifiers/theme_notifier.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String userKey = 'user';
  final String title;
  final bool removeActions;
  const CustomAppBar({required this.title, this.removeActions = false});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void logout(BuildContext context) {
    context.read<LoginNotifier>().logout();
    Navigator.popAndPushNamed(context, LoginPage.route);
  }

  void goToAbout(BuildContext context) {
    Navigator.pushNamed(context, AboutPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      actions: [
        if (!removeActions)
          TextButton(
            onPressed: () => goToAbout(context),
            child: Text(
              'Tentang',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        if (!removeActions && context.read<LoginNotifier>().user != null)
          TextButton(
            onPressed: () => logout(context),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        IconButton(
          icon: Icon(context.read<ThemeNotifier>().isDark
              ? Icons.brightness_3
              : Icons.wb_sunny),
          onPressed: () {
            context.read<ThemeNotifier>().swapTheme();
          },
        ),
      ],
    );
  }
}
