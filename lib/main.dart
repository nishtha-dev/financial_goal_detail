import 'package:financial_goal_detail/src/controller/provider/data_provider.dart';
import 'package:financial_goal_detail/src/core/theme/app_theme.dart';
import 'package:financial_goal_detail/src/view/screens/bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(360, 801));
        return ChangeNotifierProvider(
          create: (context) => DataProvider(),
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
