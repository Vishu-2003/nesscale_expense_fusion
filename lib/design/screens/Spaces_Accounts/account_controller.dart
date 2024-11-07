import 'package:expense_fusion/core/models/response_model.dart';
import 'package:expense_fusion/core/repositories/home_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AccountController extends GetxController{
  final HomeRepository _homeRepository=Get.find<HomeRepository>();
  TextEditingController spaceController=TextEditingController();
  TextEditingController amountController=TextEditingController();
  TextEditingController accountController=TextEditingController();
  Future<void>addAccount()async{
    GetResponseModel? userSpace = await _homeRepository.addAccount(
        account: accountController.text.trim(),
        amount: amountController.text.trim());
    if(userSpace?.message!=null){
      await userSpace?.message?.successSnackbar();
      Get.offNamed(Routes.SPACESACCOUNT);
    }
  }

}