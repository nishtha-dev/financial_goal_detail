import 'package:financial_goal_detail/src/controller/bloc/goal_details_bloc.dart';

import 'package:financial_goal_detail/src/core/constants/constants.dart';

import 'package:financial_goal_detail/src/core/widgets/typography/typography.dart';
import 'package:financial_goal_detail/src/view/screens/error_screen.dart';
import 'package:financial_goal_detail/src/view/screens/goal_details_row.dart';
import 'package:financial_goal_detail/src/view/widgets/contribution_bottom_sheet.dart';
import 'package:financial_goal_detail/src/view/widgets/goal_details_progress_indicator.dart';
import 'package:financial_goal_detail/src/view/widgets/need_more_investment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalDetailsView extends StatefulWidget {
  const GoalDetailsView({super.key});

  @override
  State<GoalDetailsView> createState() => _GoalDetailsViewState();
}

class _GoalDetailsViewState extends State<GoalDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<GoalDetailsBloc>().add(const GetGoalDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<GoalDetailsBloc, GoalDetailsState>(
            buildWhen: (previous, current) =>
                previous.goalDetailsDataList != current.goalDetailsDataList ||
                previous.goalDetailsDataStatus != current.goalDetailsDataStatus,
            builder: (context, state) {
              if (state.goalDetailsDataStatus.isSuccess) {
                return Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Column(children: [
                          SizedBox(height: 5.h),
                          Expanded(
                            child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  ),
                                  color: AppColors.blue,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.w, vertical: 40.h),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Column(
                                        children: [
                                          TextLargeBold(
                                            text: state
                                                .goalDetailsDataList[
                                                    state.selectedGoalIndex]
                                                .title,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          const GoalProgressIndicatorCarousel(),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          const GoalDetailRow(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    const NeedMoreInvestment()
                                  ],
                                )),
                          )
                        ])),
                    const Positioned.fill(child: ContributionsBottomSheet())
                  ],
                );
              } else if (state.goalDetailsDataStatus.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const ErrorScreen();
              }
            }));
  }
}
