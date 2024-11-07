import 'package:expense_fusion/core/models/newUser_model.dart';
import 'package:expense_fusion/core/repositories/auth_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/design/components/c_text_field.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../core/models/response_model.dart';

class SignupController extends GetxController{
  final AuthRepository _authRepository=Get.find<AuthRepository>();
  TextEditingController userName=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController Copassword=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController number=TextEditingController();
  GlobalKey<FormState>  signUpKey=GlobalKey<FormState>();
  RxBool obscurePassword=true.obs;
  RxBool obscureConfirmPassword=true.obs;
  Future<void>signUp()async {
  if(signUpKey.currentState?.validate() ?? false){
    Get.context?.loaderOverlay.show();
    PostCreateNewUserModel newUser=PostCreateNewUserModel(
        name: userName.text.trim(),
        email: email.text.trim(),
        mobileNo: number.text.trim(),
        password: password.text.trim());
    GetResponseModel? response = await _authRepository.postCreateNewUser(user: newUser);
    Get.context?.loaderOverlay.hide();
    if(response?.message!=null){
     await response?.message?.successSnackbar();
     Get.toNamed(Routes.Login);
    }
  }
  }

}