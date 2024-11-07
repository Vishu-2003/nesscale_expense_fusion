import 'package:expense_fusion/core/models/response_model.dart';
import 'package:expense_fusion/core/repositories/home_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SpaceController extends GetxController{
final HomeRepository _homeRepository=Get.find<HomeRepository>();
TextEditingController space=TextEditingController();
Future<void>addSpace()async{
  GetResponseModel? userSpace = await _homeRepository.addSpace(space: space.text.trim());
   if(userSpace?.message!=null){
   await userSpace?.message?.successSnackbar();
   Get.offNamed(Routes.AddAccount);
  }
}
}