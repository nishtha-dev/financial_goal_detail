import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_goal_detail/src/controller/goal_repository/goal_repository.dart';
import 'package:financial_goal_detail/src/model/goal_details_data.dart';
import 'package:financial_goal_detail/src/model/bar_section_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/constants.dart';

part 'goal_details_event.dart';
part 'goal_details_state.dart';

class GoalDetailsBloc extends Bloc<GoalDetailsEvent, GoalDetailsState> {
  final GoalDataServiceRepository goalDataServiceRepository;
  GoalDetailsBloc({required this.goalDataServiceRepository})
      : super(GoalDetailsState.initial()) {
    on<GetGoalDetailsEvent>(_getGoalDetailsData);
    on<SaveGoalDetailsEvent>(_saveGoalDetailsData);
    on<SetCarouselIndex>(_setCarouselIndex);
  }

  FutureOr<void> _getGoalDetailsData(
      GetGoalDetailsEvent event, Emitter<GoalDetailsState> emit) async {
    emit(state.copyWith(goalDetailsDataStatus: GoalDetailsDataStatus.loading));

    await emit.onEach(goalDataServiceRepository.getAllGoalsData(),
        onData: (docSnapShotList) {
      add(SaveGoalDetailsEvent(docSnapShotList: docSnapShotList));
    }, onError: (error, stackTrace) {
      emit(
          state.copyWith(goalDetailsDataStatus: GoalDetailsDataStatus.failure));
    });
  }

  FutureOr<void> _saveGoalDetailsData(
      SaveGoalDetailsEvent event, Emitter<GoalDetailsState> emit) {
    List<GoalDetailsData> listData = event.docSnapShotList.map((data) {
      return GoalDetailsData.fromJson(
          data.data() as Map<String, dynamic>, data.id);
    }).toList();

    emit(state.copyWith(
        goalDetailsDataList: listData,
        goalDetailsDataStatus: GoalDetailsDataStatus.success));
  }

  FutureOr<void> _setCarouselIndex(
      SetCarouselIndex event, Emitter<GoalDetailsState> emit) {
    emit(state.copyWith(selectedGoalIndex: event.index));
  }
}
