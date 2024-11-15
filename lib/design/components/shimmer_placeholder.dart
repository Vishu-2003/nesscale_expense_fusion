
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class ContainerPlaceholder extends StatelessWidget{
  final double? height;
  final double? width;
  final double borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? Opacity;

  const ContainerPlaceholder({
  super.key,
     this.height,
    this.width,
    this.borderRadius=defaultBorderRadius,
    this.margin,
    this.padding,
    this.Opacity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
      color: Colors.grey.withOpacity(Opacity??0.4),
      borderRadius: BorderRadius.circular(borderRadius)
     ),
    );
  }

}
class TextPlaceholder extends StatelessWidget{
  final double? height;
  final double? width;
  final double borderRadius;
  final double? Opacity;
  const TextPlaceholder ({
    super.key,
    this.height,
    this.width,
    this.borderRadius=12,
    this.Opacity,


  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(Opacity??0.4),
          borderRadius: BorderRadius.circular(borderRadius)
      ),
    );
  }

}