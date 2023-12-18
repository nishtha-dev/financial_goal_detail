import 'package:carousel_slider/carousel_slider.dart';

import 'package:financial_goal_detail/src/controller/bloc/goal_details_bloc.dart';
import 'package:financial_goal_detail/src/core/constants/constants.dart';
import 'package:financial_goal_detail/src/model/goal_details_data.dart';
import 'package:financial_goal_detail/src/core/widgets/typography/typography.dart';
import 'package:financial_goal_detail/src/view/screens/error_screen.dart';
import 'package:financial_goal_detail/src/view/widgets/carousel_dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class GoalProgressIndicatorCarousel extends StatelessWidget {
  const GoalProgressIndicatorCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalDetailsBloc, GoalDetailsState>(
        buildWhen: (previous, current) =>
            previous.selectedGoalIndex != current.selectedGoalIndex ||
            previous.goalDetailsDataStatus != current.goalDetailsDataStatus,
        builder: (context, goalDetailsState) {
          if (goalDetailsState.goalDetailsDataStatus.isSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider.builder(
                    itemCount: goalDetailsState.noOfGoals,
                    itemBuilder: (context, index, realIndex) {
                      return SleekCircularSlider(
                        min: 0,
                        max: 100,
                        initialValue:
                            goalDetailsState.savingPercentage.toDouble(),
                        appearance: CircularSliderAppearance(
                          angleRange: 300.0,
                          startAngle: 120.0,
                          size: 250,
                          customWidths: CustomSliderWidths(
                            progressBarWidth: 5.w,
                            trackWidth: 5.w,
                          ),
                          customColors: CustomSliderColors(
                            progressBarColor: AppColors.white,
                            hideShadow: true,
                            dotColor: Colors.transparent,
                            trackColor: AppColors.grey,
                          ),
                        ),
                        onChange: null,
                        onChangeStart: null,
                        onChangeEnd: null,
                        innerWidget: (double value) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.network(
                                  goalDetailsState.currentGoalData.icon,
                                  color: AppColors.white,
                                  width: 70.w,
                                  height: 70.h,
                                  placeholderBuilder: (context) {
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  },
                                ),
                                SizedBox(height: 15.0.h),
                                TextMedium(
                                  text: goalDetailsState
                                      .currentGoalData.getSavedAmount,
                                  color: AppColors.white,
                                ),
                                const TextSmall(
                                  text: AppLabels.youSaved,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    options: CarouselOptions(
                        pageSnapping: true,
                        onPageChanged: (index, reason) {
                          context
                              .read<GoalDetailsBloc>()
                              .add(SetCarouselIndex(index: index));
                        },
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        height: 200.h)),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    goalDetailsState.noOfGoals,
                    (index) => DotIndicator(
                      current: goalDetailsState.selectedGoalIndex,
                      index: index,
                    ),
                  ),
                )
              ],
            );
          } else if (goalDetailsState.goalDetailsDataStatus.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const ErrorScreen();
          }
        });
  }
}
