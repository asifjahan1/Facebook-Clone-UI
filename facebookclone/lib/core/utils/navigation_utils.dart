import 'package:facebookclone/core/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class NavigationUtils {
  static void navigateToMenuScreen(BuildContext context) {
    Navigator.of(context).pushNamed(MenuScreen.routeName);
  }
}
