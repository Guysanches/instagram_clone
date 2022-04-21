import 'package:flutter/material.dart';
import 'package:instagram_clone/core/app_mobile_layout.dart';
import 'package:instagram_clone/core/app_responsive_layout.dart';
import 'app_colors.dart';
import 'app_web_layout.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram resposive clone',
        theme: ThemeData.dark().copyWith(
          backgroundColor: mobileBackgroundColor,
        ),
        home: const AppResponsiveLayout(
          mobileScreenLayout: AppMobileLayout(),
          webScreenLayout: AppWebLayout(),
        ));
  }
}
