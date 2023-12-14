import 'package:financial_goal_detail/src/core/widgets/typography/text_large.dart';
import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: Color(0xff101923),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Column(
              children: [TextLarge(text: '')],
            ),
          )),
        ],
      ),
    ));
  }
}
