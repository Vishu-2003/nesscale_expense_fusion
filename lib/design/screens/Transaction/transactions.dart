

import 'package:expense_fusion/design/components/c_text.dart';
import 'package:expense_fusion/design/components/c_text_field.dart';
import 'package:expense_fusion/design/screens/Transaction/transaction_controller.dart';
import 'package:expense_fusion/utils/constants.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_theme.dart';
import '../../../utils/select_image.dart';
import '../../components/c_app_bar.dart';
class transaction extends StatefulWidget {
  const transaction({super.key});

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  Future<void> bottomSheetForTime(BuildContext context,TransactionController controller) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: primaryblack,
        builder: (BuildContext context) {
          return Container(
            height: 330,
            decoration: BoxDecoration(
                color: primaryblack,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                border: Border(top: BorderSide(color: grey1, width: 1))),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: CText(
                          'Select Duration',
                          style: TextThemeX.text18.copyWith(
                              fontWeight: FontWeight.w500, color: white),
                        )),
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.duration.length,
                          itemBuilder: (context,index){
                        return ListTile(
                          title: CText(
                            controller.duration[index].toString(),
                            style: TextThemeX.text16.copyWith(color: white),
                          ),
                          leading: selectIcon(AppIcon.unselect),
                          onTap: (){
                            controller.updateSelectedDuration(controller.duration[index].toString());
                            Get.back();
                          },
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
                        ),
                        child:
                            selectIcon(AppIcon.close, color: white, width: 32),
                      ),
                    ))
              ],
            ),
          );
        });
  }

  Future<void> bottomSheetForSpace(BuildContext context,TransactionController controller) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: primaryblack,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
                color: primaryblack,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                border: Border(top: BorderSide(color: grey1, width: 1))),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: CText(
                          'Select Space',
                          style: TextThemeX.text18.copyWith(
                              fontWeight: FontWeight.w500, color: white),
                        )),
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.space.length,
                          itemBuilder: (context,index){
                        return ListTile(
                          title:CText(
                            controller.space[index].spaceName,
                            style: TextThemeX.text16.copyWith(color: white),),
                          leading: selectIcon(AppIcon.unselect),
                          onTap: (){
                            controller.updateSelectedSpace(controller.space[index].spaceName.toString());
                            Get.back();
                          },
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
                        ),
                        child:
                        selectIcon(AppIcon.close, color: white, width: 32),
                      ),
                    ))
              ],
            ),
          );
        });
  }

  Future<void> bottomSheetForOption(BuildContext context,TransactionController controller,String Transction) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: primaryblack,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
                color: primaryblack,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                border: Border(top: BorderSide(color: grey1, width: 1))),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: CText(
                          'Select Action',
                          style: TextThemeX.text18.copyWith(
                              fontWeight: FontWeight.w500, color: white),
                        )),
                    ListTile(
                      leading: selectIcon(AppIcon.edit),
                      title: CText(
                        'Edit Transaction',
                        style: TextThemeX.text16.copyWith(color: white),
                      ),
                    ),
                    ListTile(
                      onTap: (){

                      },
                      leading: selectIcon(AppIcon.delete),
                      title: CText(
                        'Delete Transaction',
                        style: TextThemeX.text16.copyWith(color: white),
                      ),
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
                        ),
                        child:
                        selectIcon(AppIcon.close, color: white, width: 32),
                      ),
                    ))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(
        init: TransactionController(),
        builder: (controller){
      return Scaffold(
          appBar: CAppBar(
            title: 'Transactions',
            showtrailing: false,
            showleading: true,
            leading: CBackButton(),
          ),
          backgroundColor: bg,
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(14),
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: grey1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: buildBottomSheetButtons(
                                text: controller.selectedSpace,
                                border: Border(right: BorderSide(color: grey1))),
                            onTap: () {
                              bottomSheetForSpace(context,controller);
                            },
                          ),
                          InkWell(
                            child:
                            buildBottomSheetButtons(
                                text: controller.selectedDuration),
                            onTap: () {
                              bottomSheetForTime(context,controller);
                            },
                          )
                        ],
                      ),
                    )
                  ),
                ],
              ),
              controller.isLoading
             ?defaultLoader()
             :Container(
                child: Expanded(
                  child: RefreshIndicator(
                    onRefresh:controller.init,
                    backgroundColor: bg,
                    child: ListView.builder(
                        itemCount:controller.transaction.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: RichText(
                                text: TextSpan(
                                    text:controller.transaction[index].account,
                                    style: TextThemeX.text16.copyWith(color: white),
                                    children: [
                                      TextSpan(text: ' '),
                                      TextSpan(
                                          text: '${controller.transaction[index].space}',
                                          style: TextThemeX.text16.copyWith(
                                              fontSize: 14, color: Primarycolor)),
                                    ])),
                            subtitle: CText(controller.transaction[index].writeNote,
                                style: TextThemeX.text16.copyWith(fontSize: 14)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CText(controller.transaction[index].date,
                                        style: TextThemeX.text16
                                            .copyWith(fontSize: 14, color: white)),
                                    CText(
                                      controller.transaction[index].type == 'expense'
                                          ? '-${controller.transaction[index].amount}'
                                          : '+${controller.transaction[index].amount}',
                                      style: TextThemeX.text16.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: controller.transaction[index].type == 'expense'
                                                 ?LightPrimarycolor
                                                 :Secondarycolor),
                                    ),
                                  ],
                                ),
                                selectIcon(AppIcon.option, onPressed: () {
                                  bottomSheetForOption(context,controller,controller.transaction[index].name);
                                })
                              ],
                            ),
                          ).listAnimation(position: index);
                        }),
                  ),
                ),
              )
            ],
          ));
    });
  }
}

Widget buildBottomSheetButtons({required String text, Border? border}) {
  return Container(
    width: 165,
    decoration: BoxDecoration(border: border),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CText(
          text,
          style: TextThemeX.text15,
        ),
        selectIcon(AppIcon.dropDown)
      ],
    ),
  );
}
