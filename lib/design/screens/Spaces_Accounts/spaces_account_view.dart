import 'package:expense_fusion/core/repositories/auth_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/design/components/c_app_bar.dart';
import 'package:expense_fusion/design/components/c_text_field.dart';
import 'package:expense_fusion/design/screens/Spaces_Accounts/space_acount_controller.dart';
import 'package:expense_fusion/utils/constants.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_theme.dart';
import '../../../utils/select_image.dart';
import '../../components/c_text.dart';
import 'account_controller.dart';

class spacesaccount extends StatefulWidget {
  const spacesaccount({super.key});

  @override
  State<spacesaccount> createState() => _spacesaccountState();
}

class _spacesaccountState extends State<spacesaccount> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpaceAccountController>(
        init: SpaceAccountController(),
        builder: (controller) {
      return Scaffold(
        backgroundColor: bg,
        appBar: CAppBar(
          title: 'Spaces & Accounts',
          showtrailing: false,
          showleading: true,
          leading: CBackButton(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                height: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: grey1)),
                child: Row(
                  children: [
                    _buildbutton(
                        ontap: () {
                          Get.toNamed(Routes.Space);
                        },
                        text: 'Add Space',
                        color: Secondarycolor,
                        boarder: Border(
                            right: BorderSide(
                          style: BorderStyle.solid,
                          color: grey1,
                          width: 1,
                        )),
                        borderradius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        )),
                    _buildbutton(
                      ontap: () {
                       Get.offNamed(Routes.AddAccount);
                      },
                      text: 'Add Account',
                      color: LightPrimarycolor,
                      boarder: Border(
                          left: BorderSide(
                        style: BorderStyle.solid,
                        color: grey1,
                        width: 0.2,
                      )),
                      borderradius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                  ],
                ),
              ),
              controller.isLoading
              ?defaultLoader()
              :Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                margin: EdgeInsets.only(left: 12, right: 12, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child:RefreshIndicator(
                          backgroundColor: bg,
                          onRefresh: controller.init,
                          child:ListView.builder(
                              itemCount: controller.account.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                      border: Border.symmetric(
                                          vertical: BorderSide.none,
                                          horizontal: BorderSide(color: bg))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: CText(
                                          controller.account[index].space.toString(),
                                          style: TextThemeX.text16.copyWith(
                                            color: Primarycolor,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: CText(
                                          controller.account[index].accountName.toString(),
                                          style: TextThemeX.text16
                                              .copyWith(color: white, fontSize: 14),
                                        ),
                                        subtitle: CText(
                                          controller.account[index].amount.toString(),
                                          style: TextThemeX.text16.copyWith(
                                              color: Primarycolor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            selectIcon(AppIcon.delete,
                                                onPressed: () {
                                                 controller.deleteAccount(
                                                     accountName: controller.account[index].accountName.toString(),
                                                     space: controller.account[index].space.toString());
                                                }),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            selectIcon(AppIcon.edit,
                                                onPressed: () {
                                               final result = Get.toNamed(Routes.AddAccount,arguments: {
                                                  'space':controller.account[index].space,
                                                  'accountName': controller.account[index].accountName,
                                                  'amount': controller.account[index].amount,
                                                });
                                                })
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                ).listAnimation(position: index);
                              }),)
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

Widget _buildbutton(
    {required String text,
    required Border boarder,
    required Color color,
    required VoidCallback ontap,
    required BorderRadius borderradius}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(border: boarder),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 55,
          width: 174,
          decoration: BoxDecoration(
              border: boarder, color: color, borderRadius: borderradius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectIcon(AppIcon.add),
              SizedBox(
                width: 5,
              ),
              CText(
                text,
                style: TextThemeX.text20.copyWith(
                    fontWeight: FontWeight.w500, fontSize: 15, color: bg),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
