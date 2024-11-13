import 'package:expense_fusion/core/models/response_model.dart';
import 'package:expense_fusion/core/repositories/home_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/design/screens/Spaces_Accounts/space_acount_controller.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/models/get_space_model.dart';

class AccountController extends GetxController{
  @override
  void onInit() {
    getSpaces();
    super.onInit();
  }
  final HomeRepository _homeRepository=Get.find<HomeRepository>();
  TextEditingController spaceController=TextEditingController();
  TextEditingController amountController=TextEditingController();
  TextEditingController accountController=TextEditingController();
  String selectedSpace= 'Select Space';
  void updateSelectedSpace(String account){
    spaceController.text=account;
    selectedSpace=account;
    update();
  }
  Future<void>addAccount()async{
    if(accountController.text.isEmpty){'Please Enter Account'.showAlert();
      return;}
    if(amountController.text.isEmpty){'Please Enter Amount'.showAlert();
      return;}
    else{
      GetResponseModel? userSpace = await _homeRepository.addAccount(
          account: accountController.text.trim(),
          amount: amountController.text.trim(),
          space: spaceController.text.trim());
      if(userSpace?.message!=null){
        await userSpace?.message?.successSnackbar();
        Get.offNamed(Routes.SPACESACCOUNT);
      }
    }
  }
  List<GetSpaceModel> space=[];
  Future<void>getSpaces()async {
    space= await _homeRepository.getSpace();
  }
  Future<void> updateAccount({required String oldAccountName})async{
    GetResponseModel? response=await _homeRepository.updateAccount(
        accountName: oldAccountName,
        space:  spaceController.text.trim(),
        newAccountName:accountController.text.trim() ,
        amount: amountController.text.trim());
    if(response?.message!=null){
        await response?.message?.successSnackbar();
          Get.lazyPut(()=>SpaceAccountController());
          final spaceAccountController = Get.find<SpaceAccountController>();
        Get.back();
    }
  }
}