import 'package:expense_fusion/core/repositories/auth_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/design/components/c_text_field.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/login_model.dart';

class LoginController extends GetxController{
  final AuthRepository _authRepository=Get.find<AuthRepository>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  RxBool obscurePassword=true.obs;

  Future<void>login()async{
   if(loginKey.currentState?.validate()??false){
     Get.context?.loaderOverlay.show();
     final  UserLoginModel? user =  await _authRepository.login(userName: email.text, password: password.text);
     Get.context?.loaderOverlay.hide();
     if(user?.message!=null){
       user?.message?.successSnackbar();
       SharedPreferences preferences=await SharedPreferences.getInstance();
       preferences.setString('email',user!.user.toString());
       preferences.setString('name',user.fullName.toString());
       preferences.setString('apikey',user.keyDetails!.apiKey.toString());
       preferences.setString('apiSecret',user.keyDetails!.apiSecret.toString());
       Get.offAllNamed(Routes.HOME);

     }
   }
  }
}