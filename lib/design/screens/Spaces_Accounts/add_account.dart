import 'package:expense_fusion/design/components/c_app_bar.dart';
import 'package:expense_fusion/design/screens/Spaces_Accounts/account_controller.dart';
import 'package:expense_fusion/utils/extensions.dart';
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
  final AccountController controller = Get.find<AccountController>();
  late final Map<String, dynamic>? args;
  @override
  void initState() {
    super.initState();
     args = Get.arguments;
    if (args != null) {
      controller.spaceController.text = args?['space'] ?? '';
      controller.accountController.text = args?['accountName'] ?? '';
      controller.amountController.text = args?['amount']?.toString() ?? '';
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: bg,
     appBar: CAppBar(
       title: Get.arguments == null ? 'Add New Account' : 'Update Account',
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
               readOnly: true,
               labelText:controller.selectedSpace,
               hintText: controller.selectedSpace,
               hintTextStyle: TextThemeX.text16.copyWith(color:white),
               suffixIcon: selectIcon(AppIcon.dropDown),
               controller: controller.spaceController,
               onTap: (){
                 BottomSheet(context,controller);
               },
             ),
             SizedBox(height: 15,),
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
                   if (Get.arguments == null) {
                     controller.addAccount();
                   } else {
                     controller.updateAccount(oldAccountName:args?['accountName']);
                   }
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Primarycolor,
                   fixedSize:Size(334, 56),
                 ),
                 child: CText(args == null ? 'Add' : 'Update',style: TextThemeX.text16.copyWith(fontWeight: FontWeight.w500,color: bg),),
               ),
             )

           ],
         ),
       );
     })
   );
  }
}
Future<void> BottomSheet(BuildContext context, AccountController controller){
  return showModalBottomSheet(
    context: context,
    backgroundColor: primaryblack,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            color: primaryblack,
            borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
            border: Border(
                top: BorderSide(
                    color: grey1,
                    width: 1
                )
            )
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: CText('Select Space',style: TextThemeX.text18.copyWith(fontWeight: FontWeight.w500,color: white),)),
                Expanded(
                  child: ListView.builder(
                      itemCount:controller.space.length,
                      itemBuilder: (context,index){
                        return Container(
                          decoration: BoxDecoration(
                              border:Border.symmetric(vertical: BorderSide.none,horizontal: BorderSide(color: bg))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: CText(controller.space[index].name.toString(),style:TextThemeX.text16.copyWith(color: white),),
                                trailing: selectIcon(AppIcon.unselect),
                                onTap: (){
                                  controller.updateSelectedSpace(controller.space[index].name.toString());
                                  Get.back();
                                },
                              ),
                            ],

                          ),
                        );
                      }),

                )
              ],
            ),
            Positioned(
                top: -50,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),child: selectIcon(AppIcon.close,color: white,width: 32),
                  ),
                ))
          ],
        ),
      );
    },
  );
}
