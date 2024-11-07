
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/select_image.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});

  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:1),()async{
      FlutterNativeSplash.remove();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token=await preferences.getString('apikey');
      Future.delayed(const Duration(seconds: 1), () {
        if (token == null) {
          Get.offAllNamed(Routes.Login);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FlutterSplashScreen.scale(
        backgroundColor:bg,
        childWidget:selectIcon(AppImage.splash),
        duration: const Duration(seconds: 2),
      )
    );
  }
}
