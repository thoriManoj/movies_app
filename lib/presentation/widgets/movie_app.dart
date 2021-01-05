import 'package:flutter/material.dart';
import 'package:movies_app/common/screenutils/screen_util.dart';
import 'package:movies_app/presentation/journeys/home/home_screen.dart';
import 'package:movies_app/presentation/themes/app_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
