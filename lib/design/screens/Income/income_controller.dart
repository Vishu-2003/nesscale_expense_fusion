import 'package:expense_fusion/core/models/get_account_model.dart';
import 'package:expense_fusion/core/models/get_space_model.dart';
import 'package:expense_fusion/core/repositories/auth_repository.dart';
import 'package:expense_fusion/core/repositories/home_repository.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/models/post_income_model.dart';
import '../../../core/models/response_model.dart';

class IncomeController extends GetxController{
  @override
  void onInit() {
    getAccounts();
    super.onInit();
  }
final HomeRepository homeRepository=Get.find<HomeRepository>();
TextEditingController addAmountController=TextEditingController();
TextEditingController addNoteController=TextEditingController();
TextEditingController accountController=TextEditingController();


String selectedAccount= 'selected account';
void updateSelectedAccount(String account){
 accountController.text=account;
 update();
}
  void updateSelectedAccountId(String account){
    selectedAccount=account;
    update();
  }
DateTime? selectedDate=DateTime.now();
void updateSelectedDate(DateTime date){
  selectedDate=date;
  update();
}
Future<void> addIncome()async {
 Get.context?.loaderOverlay.show();
 PostIncomeModel income=PostIncomeModel(
   account:selectedAccount.trim(),
   date: selectedDate?.getDefaultDateFormat,
   amount: addAmountController.text.trim(),
   writeNote: addNoteController.text.trim()
 );
 GetResponseModel? response = await homeRepository.addIncome(income: income);
 Get.context?.loaderOverlay.hide();
 if(response?.message!=null){
   await response?.message?.successSnackbar();
   addNoteController.clear();
   addAmountController.clear();
   accountController.clear();
 }

}
  List<GetAccountModel> account=[];
  Future<void>getAccounts()async {
  account=await homeRepository.getAccount();
  update();
  }



}