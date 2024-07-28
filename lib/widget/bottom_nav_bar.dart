import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/widget/locale_provider.dart';
import 'package:task1/widget/theme_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.profile),
          label: S.of(context).myreservations,
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.home),
          label: S.of(context).home,
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.setting),
          label: S.of(context).settings,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue[900],
      onTap: onItemTapped,
    );
  }
}
