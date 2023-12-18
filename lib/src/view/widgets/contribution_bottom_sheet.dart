import 'package:financial_goal_detail/src/controller/bloc/goal_details_bloc.dart';

import 'package:financial_goal_detail/src/core/constants/constants.dart';

import 'package:financial_goal_detail/src/core/widgets/typography/typography.dart';

import 'package:financial_goal_detail/src/view/widgets/contribution_card.dart';
import 'package:financial_goal_detail/src/view/widgets/progress_bar_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContributionsBottomSheet extends StatefulWidget {
  const ContributionsBottomSheet({super.key});

  @override
  State<ContributionsBottomSheet> createState() =>
      _ContributionsBottomSheetState();
}

class _ContributionsBottomSheetState extends State<ContributionsBottomSheet> {
  late DraggableScrollableController _controller;
  final double _minSize = 0.27;
  final double _maxSize = 0.8;
  bool isFullScreen = false;

  @override
  void initState() {
    _controller = DraggableScrollableController();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _hide() => _animateSheet(_minSize);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _hide();
      },
      child: GestureDetector(
        onTap: () {},
        child: SizedBox.expand(
          child: DraggableScrollableSheet(
              controller: _controller,
              initialChildSize: _minSize,
              minChildSize: _minSize,
              maxChildSize: _maxSize,
              snap: true,
              builder: (context, controller) {
                return Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(42),
                      topRight: Radius.circular(42),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
                  child: BlocBuilder<GoalDetailsBloc, GoalDetailsState>(
                    buildWhen: (previous, current) =>
                        previous.goalDetailsDataList !=
                            current.goalDetailsDataList ||
                        previous.selectedGoalIndex != current.selectedGoalIndex,
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextSmallBold(
                                text: AppLabels.contributions,
                                color: AppColors.black,
                              ),
                              TextSmall(
                                text: AppLabels.showHistory,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          ColorfulLinearBar(sections: state.sectionsList),
                          SizedBox(height: 10.h),
                          Expanded(
                            child: ListView.builder(
                                controller: controller,
                                shrinkWrap: true,
                                itemCount: state.noOfContributions,
                                itemBuilder: (context, index) {
                                  return ContributionCard(
                                    contributionData: state.currentGoalData
                                        .contributionsDataList[index],
                                    contributionDataColor: state.currentGoalData
                                        .contributionsDataList[index].color,
                                  );
                                }),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
