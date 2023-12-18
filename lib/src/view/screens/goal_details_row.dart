import 'package:financial_goal_detail/src/controller/bloc/goal_details_bloc.dart';

import 'package:financial_goal_detail/src/core/constants/constants.dart';

import 'package:financial_goal_detail/src/model/goal_details_data.dart';
import 'package:financial_goal_detail/src/core/widgets/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalDetailRow extends StatelessWidget {
  const GoalDetailRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalDetailsBloc, GoalDetailsState>(
      buildWhen: (previous, current) =>
          previous.currentGoalData != current.currentGoalData,
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextMediumBold(
                    text: AppLabels.goal,
                  ),
                  TextSmall(
                    text:
                        'by ${state.currentGoalData.getExpectedCompletionTime}',
                    color: AppColors.grey,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: TextMediumBold(
                text: state.currentGoalData.getTotalAmount,
                textAlign: TextAlign.end,
              ),
            )
          ],
        );
      },
    );
  }
}
