import 'package:expense_fusion/design/components/c_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_theme.dart';

class Unknown404 extends StatelessWidget {
  const Unknown404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CText('404',style:TextThemeX.text20.copyWith(color: white),),),
    );
  }
}
