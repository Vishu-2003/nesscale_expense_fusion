import 'package:expense_fusion/core/models/post_expense_model.dart';
import 'package:expense_fusion/core/models/response_model.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../core/models/get_account_model.dart';
import '../../../core/models/get_space_model.dart';
import '../../../core/repositories/home_repository.dart';

class ExpenseController extends GetxController{
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
    selectedAccount=account;
    accountController.text=account;
    update();
  }
  DateTime? selectedDate=DateTime.now();
  void updateSelectedDate(DateTime date){
    selectedDate=date;
    update();
  }
  List<GetAccountModel> account=[];
  Future<void>getAccounts()async {
    account=await homeRepository.getAccount();
    update();
  }
  Future<void>addExpense()async{
    Get.context?.loaderOverlay.show();
    PostExpenseModel expense = PostExpenseModel(
      amount: addAmountController.text.trim(),
      account: accountController.text.trim(),
      writeNote: addNoteController.text.trim(),
      date: selectedDate?.getDefaultDateFormat
    );
    GetResponseModel? response = await homeRepository.addExpense(expense: expense);
    Get.context?.loaderOverlay.hide();
    if(response?.message!=null){
      await response?.message?.successSnackbar();
      addNoteController.clear();
      addAmountController.clear();
      accountController.clear();
    }

  }

}