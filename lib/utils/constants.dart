
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'app_colors.dart';

const String imagePath = 'assets/image';
const String iconPath  = 'assets/icon';
const ScrollPhysics defaultScrollablePhysics = AlwaysScrollableScrollPhysics();
const double defaultBorderRadius=40;
const double defaultButtonPressedOpacity = 0.6;
String get baseurl =>   'http://65.20.77.48:8080';


Widget defaultLoader({
  Color? color,
  double size=40,
}) =>
      Center(child:SpinKitCircle(color: color?? Primarycolor,size: size,),);