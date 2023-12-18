part of 'goal_details_bloc.dart';

class GoalDetailsState extends Equatable {
  final int selectedGoalIndex;
  final List<GoalDetailsData> goalDetailsDataList;

  final GoalDetailsDataStatus goalDetailsDataStatus;

  const GoalDetailsState(
      {this.goalDetailsDataList = const [],
      required this.goalDetailsDataStatus,
      required this.selectedGoalIndex});
  factory GoalDetailsState.initial() {
    return const GoalDetailsState(
      selectedGoalIndex: 0,
      goalDetailsDataStatus: GoalDetailsDataStatus.initial,
    );
  }
  GoalDetailsState copyWith({
    int? selectedGoalIndex,
    List<GoalDetailsData>? goalDetailsDataList,
    GoalDetailsDataStatus? goalDetailsDataStatus,
  }) {
    return GoalDetailsState(
        selectedGoalIndex: selectedGoalIndex ?? this.selectedGoalIndex,
        goalDetailsDataStatus:
            goalDetailsDataStatus ?? this.goalDetailsDataStatus,
        goalDetailsDataList: goalDetailsDataList ?? this.goalDetailsDataList);
  }

  @override
  List<Object?> get props =>
      [goalDetailsDataList, goalDetailsDataStatus, selectedGoalIndex];
}

extension GoalDetailsStateX on GoalDetailsState {
  int get noOfGoals => goalDetailsDataList.length;
  int get noOfContributions => currentGoalData.contributionsDataList.length;
  GoalDetailsData get currentGoalData => goalDetailsDataList.isNotEmpty
      ? goalDetailsDataList[selectedGoalIndex]
      : GoalDetailsData.initial();

  List<SectionData> get sectionsList {
    List<SectionData> sectionDataList = [];
    for (int i = 0; i < noOfContributions; i++) {
      sectionDataList.add(SectionData(
          color: currentGoalData.contributionsDataList[i].color,
          value: currentGoalData.contributingPricePercentage[i].toDouble()));
    }
    return sectionDataList;
  }

  List<String> get cachedGoalIconUrlsList => goalDetailsDataList
      .fold([], (previousValue, element) => [...previousValue, element.icon]);
  num get savingPercentage {
    return (currentGoalData.savedAmount / currentGoalData.totalAmount) * 100;
  }
}
