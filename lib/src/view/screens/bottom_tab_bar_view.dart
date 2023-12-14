import 'package:financial_goal_detail/src/model/tab_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomTabBarView extends StatefulWidget {
  const BottomTabBarView(
      {super.key, required this.onTap, required this.selectedIndex});
  final Function(int currentIndex) onTap;
  final int selectedIndex;
  @override
  State<BottomTabBarView> createState() => _BottomTabBarViewState();
}

class _BottomTabBarViewState extends State<BottomTabBarView> {
  final List<TabItemModel> bottomTabs = [
    TabItemModel(
      icon: const Icon(Icons.home),
      title: 'Home',
      route: '',
    ),
    TabItemModel(
      icon: const Icon(Icons.sync),
      title: 'Data Sync',
      route: '',
    ),
    TabItemModel(
      icon: const Icon(Icons.headphones),
      title: 'Book',
      route: '',
    ),
    TabItemModel(
      icon: const Icon(Icons.settings),
      title: 'Idea',
      route: '',
    ),
  ];

  List<BottomNavigationBarItem> _buildItems() {
    return <BottomNavigationBarItem>[
      for (int i = 0; i < bottomTabs.length; i++)
        BottomNavigationBarItem(
          icon: SizedBox.square(
            dimension: 25.sp,
            child: bottomTabs[i].icon,
          ),
          label: bottomTabs[i].title,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 15.0,
      items: _buildItems(),
      currentIndex: widget.selectedIndex,
      type: BottomNavigationBarType.fixed,
      // backgroundColor: context.fpTheme.background.zero,
      // selectedItemColor: context.fpTheme.red.zero,
      // selectedLabelStyle: context.fpTheme.medium.minusThree,
      // unselectedItemColor: context.fpTheme.background.fiveHalf,
      // unselectedLabelStyle: context.fpTheme.medium.minusThree,
      onTap: (int currentIndex) {
        widget.onTap(currentIndex);
      },
    );
  }
}
