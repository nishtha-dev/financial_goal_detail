import 'package:flutter/material.dart';
import 'package:financial_goal_detail/src/model/model.dart';

class ColorfulLinearBar extends StatelessWidget {
  final List<SectionData> sections;

  const ColorfulLinearBar({super.key, required this.sections});

  double currentEleRation(index, total) {
    List<SectionData> remainingSection =
        sections.reversed.toList().sublist(index);
    return remainingSection.fold(0, (previousValue, section) {
      return previousValue + (section.value / totalValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      child: LayoutBuilder(
        builder: (_, constrains) {
          return Stack(
            children: buildSections(constrains.maxWidth),
          );
        },
      ),
    );
  }

  List<Widget> buildSections(double totalBarWidth) {
    List<Widget> sectionWidgets = [];
    for (var section in sections.reversed) {
      int index = sections.reversed.toList().indexOf(section);
      sectionWidgets.add(
        AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: totalBarWidth * currentEleRation(index, totalBarWidth),
            height: double.infinity,
            decoration: BoxDecoration(
              color: section.color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),
            ),
          ),
        ),
      );
    }
    return sectionWidgets;
  }

  double get totalValue =>
      sections.map((section) => section.value).reduce((a, b) => a + b);
}
