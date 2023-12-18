import 'package:financial_goal_detail/src/controller/bloc/goal_details_bloc.dart';

import 'package:financial_goal_detail/src/core/constants/constants.dart';
import 'package:financial_goal_detail/src/model/goal_details_data.dart';
import 'package:financial_goal_detail/src/core/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeedMoreInvestment extends StatelessWidget {
  const NeedMoreInvestment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardColorBlue,
      ),
      child: BlocBuilder<GoalDetailsBloc, GoalDetailsState>(
        buildWhen: (previous, current) =>
            previous.currentGoalData != current.currentGoalData,
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  const TextSmallBold(
                    text: AppLabels.moreSavings,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextSmallBold(
                      text: '\$${state.currentGoalData.getRemainingAmount}',
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  const TextSmallBold(
                    text: AppLabels.monthlySavingProjection,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextSmallBold(
                      text:
                          '\$${state.currentGoalData.getMonthlySavingsAmount}',
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextExtraSmall(
                    text: state.currentGoalData.suggestion,
                    color: AppColors.white,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
