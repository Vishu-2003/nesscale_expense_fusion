import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../design/components/c_core_button.dart';

String setImage(String lightImage)=>lightImage;


Widget selectIcon(String icon,{
  double? width,
  Color? color,
  void Function()? onPressed,
}) {
  return CCoreButton(
    onPressed: onPressed,
    child:Image.asset(
      icon,
      width: width,
      color: color,
      height: width,
    ),
  );
}
