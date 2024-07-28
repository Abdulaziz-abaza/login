import 'package:flutter/material.dart';
import 'package:task1/constant/constant.dart';
import 'package:task1/widget/AccountPage.dart';
import 'package:task1/widget/bottom_nav_bar.dart';
import 'package:task1/widget/main_page_content_component.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController?.dispose();
    super.dispose();
  }

  static List<Widget> _widgetOptions(MotionTabBarController controller) =>
      <Widget>[
        MainPageContentComponent(
          title: 'Dashboard Page',
          controller: controller,
        ),
        MainPageContentComponent(
          title: 'Home Page',
          controller: controller,
        ),
        MainPageContentComponent(
          title: 'Settings Page',
          controller: controller,
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Uni Soft",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppConstants.textColor),
        ),
      ),
      body: Center(
        child: _motionTabBarController != null
            ? _widgetOptions(_motionTabBarController!).elementAt(_selectedIndex)
            : CircularProgressIndicator(),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
