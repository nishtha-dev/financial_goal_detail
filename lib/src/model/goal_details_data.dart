import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_goal_detail/src/core/constants/app_constants.dart';
import 'package:financial_goal_detail/src/core/utils/utils.dart';
import 'package:intl/intl.dart';

class GoalDetailsData {
  final String goalId;
  final String title;
  final String icon;
  final String description;
  final num totalAmount;
  final num savedAmount;
  final num monthlySavingsAmount;
  final List<ContributionsData> contributionsDataList;
  final String suggestion;

  GoalDetailsData(
      {required this.goalId,
      required this.contributionsDataList,
      required this.description,
      required this.totalAmount,
      required this.monthlySavingsAmount,
      required this.savedAmount,
      required this.icon,
      required this.title,
      required this.suggestion});
  factory GoalDetailsData.initial() {
    return GoalDetailsData(
        goalId: '',
        contributionsDataList: [],
        description: '',
        totalAmount: 0,
        monthlySavingsAmount: 0,
        savedAmount: 0,
        icon: '',
        title: '',
        suggestion: '');
  }

  factory GoalDetailsData.fromJson(Map<String, dynamic> data, String goalId) {
    return GoalDetailsData(
        goalId: goalId,
        title: data['title'],
        contributionsDataList: data['contributions'] == null
            ? []
            : List<ContributionsData>.from(data['contributions']!.map((x) {
                int index = data['contributions'].indexOf(x);
                return ContributionsData.fromJson(
                    x,
                    AppConstants.getRandomProgressBarColorList(
                        data['contributions'].length)[index]);
              })),
        description: data['description'],
        monthlySavingsAmount: data['monthly_saving_amount'],
        savedAmount: data['saved_amount'],
        totalAmount: data['total_amount'],
        icon: data['icon'],
        suggestion: data['suggestion']);
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "contributions":
            List<dynamic>.from(contributionsDataList.map((x) => x.toJson())),
        "description": description,
        "monthly_saving_amount": monthlySavingsAmount,
        "saved_amount": savedAmount,
        "total_amount": totalAmount,
        "icon": icon,
        "suggestion": suggestion
      };
}

class ContributionsData {
  final num contributingPrice;
  final String title;
  final Timestamp date;
  final Color color;

  ContributionsData(
      {required this.contributingPrice,
      required this.date,
      required this.title,
      required this.color});

  factory ContributionsData.fromJson(Map<String, dynamic> data, Color color) =>
      ContributionsData(
        contributingPrice: data['contributing_price'],
        title: data['title'],
        date: data['date'],
        color: data['color'] ?? color,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "contributing_price": contributingPrice,
        "date": date.toDate().toUtc(),
      };
}

extension ContributionDataX on ContributionsData {
  String get getContributingPrice =>
      '\$${CustomFormatter.compactFormattedNumberFromNum(contributingPrice, pattern: '#,###,###,###,##0')}';
  String get getTitle => title
      .split(' ')
      .map((contributionValue) =>
          contributionValue[0].toUpperCase() + contributionValue.substring(1))
      .join(' ');
  String get getContributionDate =>
      DateFormat('dd MMM yyyy').format(date.toDate());
}

extension GoalDetailsDataX on GoalDetailsData {
  String get getTotalAmount =>
      '\$${CustomFormatter.compactFormattedNumberFromNum(totalAmount, pattern: '#,###,###,###,##0')}';
  String get getRemainingAmount =>
      CustomFormatter.compactFormattedNumberFromNum(totalAmount - savedAmount,
          pattern: '#,###,###,###,##0');
  String get getSavedAmount =>
      '\$${CustomFormatter.compactFormattedNumberFromNum(savedAmount, pattern: '#,###,###,###,##0')}';
  String get getMonthlySavingsAmount =>
      CustomFormatter.compactFormattedNumberFromNum(monthlySavingsAmount,
          pattern: '#,###,###,###,##0');

  String get getExpectedCompletionTime {
    int noOfMonths = (totalAmount - savedAmount) ~/ 40000;

    DateTime newDate = DateTime(DateTime.now().year,
        DateTime.now().month + noOfMonths, DateTime.now().day);

    String formattedDate = DateFormat('MMM yyyy').format(newDate);
    return formattedDate;
  }

  List<num> get contributingPricePercentage {
    return contributionsDataList.map((contributionsData) {
      return (contributionsData.contributingPrice / totalAmount) * 100;
    }).toList();
  }
}
