import 'package:expense_fusion/design/components/c_text.dart';
import 'package:expense_fusion/design/components/c_text_field.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Future<void> BottomSheetfortime(BuildContext context) {
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
                    ListTile(
                      title: CText(
                        'Today',
                        style: TextThemeX.text16.copyWith(color: white),
                      ),
                      leading: selectIcon(AppIcon.select),
                    ),
                    ListTile(
                      title: CText(
                        '1 Week',
                        style: TextThemeX.text16.copyWith(color: white),
                      ),
                      leading: selectIcon(AppIcon.unselect),
                    ),
                    ListTile(
                      title: CText(
                        '1 Month',
                        style: TextThemeX.text16.copyWith(color: white),
                      ),
                      leading: selectIcon(AppIcon.unselect),
                    ),
                    ListTile(
                      title: CText(
                        '6 Month',
                        style: TextThemeX.text16.copyWith(color: white),
                      ),
                      leading: selectIcon(AppIcon.unselect),
                    ),
                    ListTile(
                      title: CText(
                        '1 Year',
                        style: TextThemeX.text16.copyWith(color: white),
                      ),
                      leading: selectIcon(AppIcon.unselect),
                    ),
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

  Future<void> BottomSheetfortype(BuildContext context) {
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
                          itemCount: 2,
                          itemBuilder: (context,index){
                        return ListTile(
                          title:CText(
                            'Home Expense',
                            style: TextThemeX.text16.copyWith(color: white),),
                          leading: selectIcon(AppIcon.unselect),
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

  Future<void> BottomSheetforoption(BuildContext context) {
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
                          child: _buildbottomsheetbuttons(
                              text: 'Home Expense',
                              border: Border(right: BorderSide(color: grey1))),
                          onTap: () {
                            BottomSheetfortype(context);
                          },
                        ),
                        InkWell(
                          child:
                              _buildbottomsheetbuttons(text: 'Current month'),
                          onTap: () {
                            BottomSheetfortime(context);
                          },
                        )
                      ],
                    ),
                  ).showShimmer(),
                ),
              ],
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                    itemCount: 19,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: RichText(
                            text: TextSpan(
                                text: 'HDFC Bank',
                                style: TextThemeX.text16.copyWith(color: white),
                                children: [
                              TextSpan(text: ' '),
                              TextSpan(
                                  text: '(Home Expense)',
                                  style: TextThemeX.text16.copyWith(
                                      fontSize: 14, color: Primarycolor)),
                            ])),
                        subtitle: CText('Shopping for brother’s birthday',
                            style: TextThemeX.text16.copyWith(fontSize: 14)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CText('10 Apr 2023',
                                    style: TextThemeX.text16
                                        .copyWith(fontSize: 14, color: white)),
                                CText(
                                  '- ₹12,256',
                                  style: TextThemeX.text16.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: LightPrimarycolor),
                                ),
                              ],
                            ),
                            selectIcon(AppIcon.option, onPressed: () {
                              BottomSheetforoption(context);
                            })
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}

Widget _buildbottomsheetbuttons({required String text, Border? border}) {
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
