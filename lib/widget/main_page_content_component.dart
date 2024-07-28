import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:task1/generated/l10n.dart';
import 'package:task1/widget/AccountPage.dart';

class MainPageContentComponent extends StatelessWidget {
  const MainPageContentComponent({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String title;
  final MotionTabBarController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            height: 250,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                GridItem(icon: IconlyLight.search, label: S.of(context).search),
                GridItem(icon: IconlyLight.paper, label: S.of(context).office),
                GridItem(icon: IconlyLight.send, label: S.of(context).share),
                GridItem(
                    icon: IconlyLight.profile, label: S.of(context).accounts),
                GridItem(
                    icon: IconlyLight.document, label: S.of(context).servers),
                GridItem(
                    icon: IconlyLight.info_circle, label: S.of(context).about),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const SearchField(),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('data of your any tdydydj'),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(IconlyLight.calendar),
              hintText: S.of(context).searchByPassword,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
