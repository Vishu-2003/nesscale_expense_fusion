import 'package:expense_fusion/design/components/c_app_bar.dart';
import 'package:expense_fusion/design/screens/Spaces_Accounts/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_theme.dart';
import '../../../utils/select_image.dart';
import '../../components/c_text.dart';
import '../../components/c_text_field.dart';

class addaccount extends StatefulWidget {
  const addaccount({super.key});

  @override
  State<addaccount> createState() => _addaccountState();
}

class _addaccountState extends State<addaccount> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: bg,
     appBar: CAppBar(
       title: 'Add New Account',
       showtrailing: false,
       showleading: true,
       leading: CBackButton(),
     ),
     body: GetBuilder<AccountController>(
         init: AccountController(),
         builder: (controller){
       return Container(
         padding: EdgeInsets.all(16),
         child: Column(
           children: [
             CTextField(
               labelText: 'Enter Account',
               controller: controller.accountController,
             ),
             SizedBox(height: 15,),
             CTextField(
               labelText: 'Enter Amount',
               controller: controller.amountController,
             ),
             SizedBox(height: 25,),
             Container(
               padding: EdgeInsets.only(top: 10,right: 16,left: 16,bottom: 10),
               child: ElevatedButton(
                 onPressed: () {
                  controller.addAccount();
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Primarycolor,
                   fixedSize:Size(334, 56),
                 ),
                 child: CText('Add',style: TextThemeX.text16.copyWith(fontWeight: FontWeight.w500,color: bg),),
               ),
             )

           ],
         ),
       );
     })
   );
  }
}

