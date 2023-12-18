import 'dart:math';
import 'package:financial_goal_detail/src/core/constants/constants.dart';
import 'package:financial_goal_detail/src/model/model.dart';

import 'package:flutter/material.dart';

class AppConstants {
  static List<Color> progressBarColorList = [
    AppColors.cardColorBlue,
    AppColors.yellow,
    AppColors.green
  ];

  static List<Color> getRandomProgressBarColorList(int noOfBarElements) {
    Color tempColor = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );
    List<Color> randomProgressBarColorList = progressBarColorList;
    for (int i = 0; i < (noOfBarElements - 3); i++) {
      randomProgressBarColorList.add(tempColor);
    }
    return randomProgressBarColorList;
  }

  static final List<TabItemModel> bottomTabs = [
    TabItemModel(
      icon: const Icon(Icons.home),
      label: '',
    ),
    TabItemModel(
      icon: const Icon(Icons.sync),
      label: '',
    ),
    TabItemModel(
      icon: Image.asset(AssetImages.circularTabIcon),
      label: '',
    ),
    TabItemModel(
      icon: const Icon(Icons.settings),
      label: '',
    ),
  ];
}
