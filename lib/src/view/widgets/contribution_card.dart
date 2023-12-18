import 'package:financial_goal_detail/src/core/constants/constants.dart';
import 'package:financial_goal_detail/src/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widgets/typography/typography.dart';

class ContributionCard extends StatelessWidget {
  const ContributionCard(
      {super.key,
      required this.contributionData,
      required this.contributionDataColor});
  final ContributionsData contributionData;
  final Color contributionDataColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 8.h,
            width: 8.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: contributionDataColor),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSmall(
                    text: contributionData.getTitle,
                    color: AppColors.black,
                  ),
                  TextExtraSmall(
                    text: contributionData.getContributionDate,
                    color: AppColors.grey,
                  )
                ],
              )),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
              flex: 2,
              child: TextSmall(
                text: contributionData.getContributingPrice,
                color: AppColors.black,
                textAlign: TextAlign.end,
              )),
        ],
      ),
    );
  }
}
