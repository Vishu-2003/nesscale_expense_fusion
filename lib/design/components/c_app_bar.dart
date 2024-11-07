import 'dart:io';

import 'package:expense_fusion/design/components/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_theme.dart';
import '../../utils/select_image.dart';
import 'c_text.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showleading;
  final bool showtrailing;
  final Widget? leading;
  final double leadingWidth;
  final double? scrolledUnderElevation;

  const CAppBar({
    super.key,
    required this.showtrailing,
    this.title,
    this.leading,
    this.leadingWidth = 40,
    this.showleading = true,
    this.scrolledUnderElevation,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bg,
      centerTitle: true,
      actions:showtrailing?
      [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(children: [
          selectIcon(AppIcon.menu),
          SizedBox(width: 5,),
          CText('menu',style: TextThemeX.text16.copyWith(color: white,fontWeight: FontWeight.w500),),
        ],),
      ),

        ]:[],
      title:CText(title ??'',style: TextThemeX.text20.copyWith(fontSize: 18,fontWeight: FontWeight.w500),),
      leading:leading
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(66);
  
}
class CBackButton extends StatelessWidget {
  const CBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return selectIcon(
      AppIcon.arrowLeft,
      color: white,
      onPressed: () {
        if (navigator?.canPop() ?? false) {
          Get.back();
        }
      },
    );
  }
}