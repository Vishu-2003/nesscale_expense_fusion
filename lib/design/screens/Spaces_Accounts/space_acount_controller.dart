import 'package:expense_fusion/core/models/get_space_model.dart';
import 'package:expense_fusion/core/models/response_model.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:get/get.dart';

import '../../../core/models/get_account_model.dart';
import '../../../core/repositories/home_repository.dart';

class SpaceAccountController extends GetxController{
  @override
  void onInit() {
    init();
    super.onInit();
  }
  final HomeRepository _homeRepository=Get.find<HomeRepository>();
  bool isLoading = false;
  Future<void>init()async{
    isLoading=true;
    update();
    await getSpace();
    await getAccount();
    isLoading=false;
    update();
  }
  List<GetSpaceModel> space=[];
  Future<void>getSpace()async {
    space= await _homeRepository.getSpace();
    update();
  }
  List<GetAccountModel> account=[];
  Future<void>getAccount()async{
    account=await _homeRepository.getAccount();
    update();
  }
  Future<void> deleteAccount({required String accountName,required String space})async{
    GetResponseModel? response=await _homeRepository.deleteAccount(accountName:accountName, space: space);
    if(response?.message!=null){
      await response?.message?.successSnackbar();
      update();
    }

  }

}