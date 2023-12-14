import 'package:financial_goal_detail/src/core/widgets/typography/text_large.dart';
import 'package:flutter/material.dart';

class GoalDetailsWidget extends StatelessWidget {
  const GoalDetailsWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextLarge(
          text: '',
        )
      ],
    );
  }
}
