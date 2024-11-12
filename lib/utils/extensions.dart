import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math' as math;
import '../design/components/c_text.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

extension BuildContextExtension on BuildContext{
  double get topPadding => math.max(statusBarHeight + 15, 15);
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;
  double get bottomPadding => math.max(bottomSafeHeight + 15, 15);
  double get bottomSafeHeight => MediaQuery.of(this).viewPadding.bottom;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

}

extension DateTimeE7n on DateTime {
  /// dd-MM-yyyy
  String get getDefaultDateFormat => DateFormat('yyyy-MM-dd').format(this);
}

extension WidgetExtension on Widget {

  Widget listAnimation({
    required int position,
    double? verticalOffset,
    double? horizontalOffset,
    Duration? delay = const Duration(milliseconds: 0),
  }){
    return AnimationConfiguration.staggeredList(
      position: position,
      child: FadeInAnimation(
        delay: delay,
        duration: 400.ms,
        curve: Curves.decelerate,
        child: SlideAnimation(
          delay: delay,
          duration: 400.ms,
          curve: Curves.decelerate,
          horizontalOffset: horizontalOffset,
          verticalOffset: verticalOffset ?? -40,
          child: this,
        ),
      ),
    );

  }



  Widget showShimmer({Color? color})
  {
    return Shimmer.fromColors(
        child: this,
        baseColor: color??white.withOpacity(0.5),
        direction: ShimmerDirection.ltr,
        highlightColor:grey1
    );
  }
}
extension StringExtension on String{
  dynamic errorSnackbar({void Function(GetSnackBar)? onTap}) {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Error !',
        this,
        onTap: onTap,
        backgroundColor: red,
        colorText:bg ,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }

  dynamic successSnackbar({void Function(GetSnackBar)? onTap}) {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Success !',
        this,
        onTap: onTap,
        backgroundColor: Secondarycolor,
        colorText: bg,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }

 dynamic showAlert(){
    Get.dialog(AlertDialog(
      title: CText('Alert  !',style: TextThemeX.text16.copyWith(color: bg)),
      content:CText(this,style: TextThemeX.text16.copyWith(color: bg)),
      backgroundColor:LightPrimarycolor,
      actions: [
        TextButton(onPressed: (){Get.back();}, child:CText('Ok', style: TextThemeX.text16.copyWith(color: bg)))
      ],

    ));
  }

}
extension ResponseExt on Response{
  bool get isSuccess => statusCode! >= 200 || statusCode! < 300;
}
extension ColumnAnimationExtension on Column {
  Widget columAnimation({
    double? verticalOffset,
    double? horizontalOffset,
    Duration? delay = const Duration(milliseconds: 0),
  }) {
    List<Widget> animatedChildren = [];

    for (int i = 0; i < children.length; i++) {
      animatedChildren.add(
        AnimationConfiguration.staggeredList(
          position: i,
          child: FadeInAnimation(
            delay: Duration(milliseconds: i * 100), // Staggered delay
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
            child: SlideAnimation(
              delay: Duration(milliseconds: i * 100),
              duration: const Duration(milliseconds: 400),
              curve: Curves.decelerate,
              horizontalOffset: horizontalOffset,
              verticalOffset: verticalOffset ?? -40.0,
              child: children[i],
            ),
          ),
        ),
      );
    }

    return Column(
      children: animatedChildren,
    );
  }
}


