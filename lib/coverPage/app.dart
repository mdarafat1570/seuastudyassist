import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:seustudyassist/coverPage/controller_binder.dart';
import 'package:seustudyassist/coverPage/features/personalization/screens/info_fillup_screen.dart';

import 'package:seustudyassist/coverPage/utils/theme/theme.dart';

import 'features/personalization/controllers/services/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: AppTheme().getThemeMode(),
      home: const InfoFillUpScreen(),
    );
  }
}
