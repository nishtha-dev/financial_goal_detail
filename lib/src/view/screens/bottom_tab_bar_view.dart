import 'package:financial_goal_detail/src/core/constants/constants.dart';

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
  List<BottomNavigationBarItem> _buildItems() {
    return <BottomNavigationBarItem>[
      for (int i = 0; i < AppConstants.bottomTabs.length; i++)
        BottomNavigationBarItem(
            icon: SizedBox.square(
              dimension: 30.sp,
              child: AppConstants.bottomTabs[i].icon,
            ),
            label: AppConstants.bottomTabs[i].label),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 15.0,
      iconSize: 30,
      items: _buildItems(),
      currentIndex: widget.selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.darkBlue,
      unselectedItemColor: AppColors.darkGrey,
      onTap: (int currentIndex) {
        if (currentIndex == 2) {
          widget.onTap(currentIndex);
        }
      },
    );
  }
}
