import 'package:expense_fusion/design/components/c_app_bar.dart';
import 'package:expense_fusion/design/components/c_core_button.dart';
import 'package:expense_fusion/design/components/c_text_field.dart';
import 'package:expense_fusion/design/screens/Spaces_Accounts/space_controller.dart';
import 'package:expense_fusion/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_theme.dart';
import '../../components/c_text.dart';

class spaces extends StatefulWidget {
  const spaces({super.key});

  @override
  State<spaces> createState() => _spacesState();
}

class _spacesState extends State<spaces> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpaceController>(
        init: SpaceController(),
        builder:(controller){
          return Scaffold(
            appBar: CAppBar(
              title: 'Create Space',
              showtrailing: false,
              showleading: true,
              leading: CBackButton(),
            ),
            backgroundColor: bg,
            body: Container(
              padding: EdgeInsets.all(16),
              child: Column(
               children: [
                 CTextField(
                   labelText: 'Enter Space Name',
                   controller: controller.space,
                 ),
                 CCoreButton(child:
                 Container(
                   padding: EdgeInsets.only(top: 20,right: 16,left: 16,bottom: 10),
                   child: ElevatedButton(
                     onPressed: () {
                       controller.addSpace();
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Primarycolor,
                       fixedSize:Size(334, 56),
                     ),
                     child: CText('Next',style: TextThemeX.text16.copyWith(fontWeight: FontWeight.w500,color: bg),),
                   ),
                 ))
               ],
              ),
            ),

          );
        });
  }
}
