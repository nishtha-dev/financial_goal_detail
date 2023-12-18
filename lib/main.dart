import 'package:financial_goal_detail/firebase_options.dart';
import 'package:financial_goal_detail/src/controller/bloc/goal_details_bloc.dart';

import 'package:financial_goal_detail/src/controller/goal_repository/goal_repository_impl.dart';

import 'package:financial_goal_detail/src/core/theme/app_theme.dart';
import 'package:financial_goal_detail/src/view/screens/bottom_tab_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(360, 801));
        return BlocProvider(
          create: (context) => GoalDetailsBloc(
              goalDataServiceRepository: GoalDataServiceRepositoryImpl()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Financial Goal Detail Page',
            theme: AppTheme().themeData,
            home: const BottomTabBar(),
          ),
        );
      },
    );
  }
}
