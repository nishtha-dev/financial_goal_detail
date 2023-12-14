import 'package:financial_goal_detail/src/view/screens/bottom_tab_bar_view.dart';
import 'package:financial_goal_detail/src/view/screens/goal_details_view.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    super.key,
  });

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectedIndexValue = 0;
  static const List<Widget> _pages = <Widget>[
    SizedBox(),
    SizedBox(),
    GoalDetailsView(),
    SizedBox()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages.elementAt(selectedIndexValue),
      bottomNavigationBar: BottomTabBarView(
        selectedIndex: selectedIndexValue,
        onTap: (int currentIndex) {
          setState(() {
            selectedIndexValue = currentIndex;
          });
        },
      ),
    );
  }
}
