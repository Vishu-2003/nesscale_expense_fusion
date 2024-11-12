  import 'package:expense_fusion/design/components/c_app_bar.dart';
  import 'package:expense_fusion/design/components/c_text_field.dart';
  import 'package:expense_fusion/utils/validators.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get_core/src/get_main.dart';
  import 'package:get/get.dart';


  import '../../../utils/app_assets.dart';
  import '../../../utils/app_colors.dart';
  import '../../../utils/app_text_theme.dart';
  import '../../../utils/select_image.dart';
  import '../../components/c_text.dart';
  import 'income_controller.dart';

  class addIncome extends StatefulWidget {
    const addIncome({super.key});

    @override
    State<addIncome> createState() => _addIncomeState();
  }

  class _addIncomeState extends State<addIncome> {
    @override
    Widget build(BuildContext context) {
     return GetBuilder<IncomeController>(
        init: IncomeController(),
         builder: (controller){
         return Scaffold(
        backgroundColor:  bg,
        appBar: CAppBar(
          title: 'Add Income',
          showtrailing: false,
          showleading: true,
          leading: CBackButton(),
        ),
        body: Container(
          height: 384,
          margin: EdgeInsets.all(16),
          width: 358,
          child: Form(
            child: Column(
              children: [
                CTextField(
                  readOnly: true,
                  labelText: 'Select Account',
                  hintText: controller.selectedAccount,
                  hintTextStyle: TextThemeX.text16.copyWith(color:white),
                  suffixIcon: selectIcon(AppIcon.dropDown),
                  controller: controller.accountController,
                  onTap: (){
                    BottomSheet(context,controller);
                  },
                ),
                SizedBox(height: 15,),
                CDatePickerField(
                  hinttext: 'Date',
                  initialDate:controller.selectedDate,
                  lastDate: DateTime.now(),
                  onDateSelected: (date){
                       controller.updateSelectedDate(date!);
                  },
                ),
                SizedBox(height: 15,),
                CTextField(
                  prefixIcon:Padding(
                    padding: const EdgeInsets.only(top: 12,left: 12,bottom: 12,right: 5),
                    child: CText('₹',style: TextThemeX.text16.copyWith(color: white),),
                  ),
                  prefixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0
                  ),
                  hintText: 'Enter amount',
                  keyboardType: TextInputType.phone,
                  controller: controller.addAmountController,
                  validator: (value)=>AppValidator.emptyNullValidator(value,errorMessage: 'Please enter amount'),
                ),
                SizedBox(height: 15,),
                CTextField(
                  hintText: 'Write note',
                  controller: controller.addNoteController,
                  keyboardType: TextInputType.text,
                  validator: (value)=>AppValidator.emptyNullValidator(value),
                ),

                SizedBox(height: 25,),
                 Container(
                   padding: EdgeInsets.only(top: 10,right: 16,left: 16,bottom: 10),
                   child: ElevatedButton(
                     onPressed: () {
                       controller.addIncome();
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Primarycolor,
                       fixedSize:Size(334, 56),
                     ),
                     child: CText('Submit',style: TextThemeX.text16.copyWith(fontWeight: FontWeight.w500,color: bg),),
                               ),
                 )
              ],
            ),
          ),
        ),

      );});
    }
  }
  Future<void> BottomSheet(BuildContext context, IncomeController controller){
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
                      child: CText('Select Account',style: TextThemeX.text18.copyWith(fontWeight: FontWeight.w500,color: white),)),
                  Expanded(
                    child: ListView.builder(
                        itemCount:controller.account.length,
                        itemBuilder: (context,index){
                          return Container(
                            decoration: BoxDecoration(
                                border:Border.symmetric(vertical: BorderSide.none,horizontal: BorderSide(color: bg))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                                  child: CText(controller.account[index].space.toString(),style:TextThemeX.text16.copyWith(color:Primarycolor,fontSize: 12),),
                                ),
                               ListTile(
                                  title: CText(controller.account[index].accountName.toString(),style:TextThemeX.text16.copyWith(color: white),),
                                  trailing: selectIcon(AppIcon.unselect),
                                  onTap: (){
                                    controller.updateSelectedAccount(controller.account[index].accountName.toString());
                                    controller.updateSelectedAccountId(controller.account[index].name.toString());
                                    print(controller.selectedAccount);
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