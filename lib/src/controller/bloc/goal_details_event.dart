part of 'goal_details_bloc.dart';

class GoalDetailsEvent extends Equatable {
  const GoalDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetGoalDetailsEvent extends GoalDetailsEvent {
  const GetGoalDetailsEvent();
}

class SaveGoalDetailsEvent extends GoalDetailsEvent {
  final List<DocumentSnapshot> docSnapShotList;
  const SaveGoalDetailsEvent({required this.docSnapShotList});
}

class SetCarouselIndex extends GoalDetailsEvent {
  final int index;
  const SetCarouselIndex({required this.index});
}
