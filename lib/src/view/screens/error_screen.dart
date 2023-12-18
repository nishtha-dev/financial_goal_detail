import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:financial_goal_detail/src/core/constants/constants.dart';
import '../../core/widgets/typography/typography.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: AppColors.blue,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetImages.noDataFound,
              height: 50.h,
              width: 50.h,
            ),
            SizedBox(height: 20.h),
            SizedBox(height: 8.h),
            const TextMedium(
              text: 'Something went wrong',
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
