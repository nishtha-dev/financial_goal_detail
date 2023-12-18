import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_goal_detail/src/controller/goal_repository/goal_repository.dart';

class GoalDataServiceRepositoryImpl extends GoalDataServiceRepository {
  static FirebaseFirestore fireStoreDb = FirebaseFirestore.instance;

  @override
  Stream<List<DocumentSnapshot>> getAllGoalsData() async* {
    Stream<List<DocumentSnapshot>> docSnapshotData = fireStoreDb
        .collection('Goals')
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs);
    try {
      await for (List<DocumentSnapshot> dataList in docSnapshotData) {
        yield dataList;
      }
    } catch (e) {
      rethrow;
    }
  }
}
