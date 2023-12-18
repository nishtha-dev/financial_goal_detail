import 'package:financial_goal_detail/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator(
      {super.key, required int current, required this.index, this.color})
      : _current = current;

  final int _current;
  final int index;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 6.0.w,
      height: 6.0.h,
      margin: EdgeInsets.only(left: 6.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: _current == index ? AppColors.white : AppColors.grey),
    );
  }
}
