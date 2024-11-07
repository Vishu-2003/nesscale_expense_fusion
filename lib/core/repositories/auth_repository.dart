import 'package:expense_fusion/core/models/newUser_model.dart';
import 'package:expense_fusion/core/models/response_model.dart';
import 'package:expense_fusion/core/services/base_services.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../models/login_model.dart';
import '../providers/auth_provider.dart';
import 'package:get/get.dart';

class AuthRepository{

 final  AuthProvider _authProvider = Get.find<AuthProvider>();

  Future<GetResponseModel?>postCreateNewUser({required PostCreateNewUserModel user})async{
    try{
     return await _authProvider.postCreateNewUser(user: user);
    }on BadResponseException catch(e){
      e.message?.errorSnackbar();
    }catch(e){
      debugPrint(e.toString());
    }return null;
  }
  Future<UserLoginModel?>login({required String userName,required String password}) async{
    try{
     return _authProvider.login(userName: userName, password: password);
    }on BadResponseException catch(e){
      e.message?.errorSnackbar();
    }catch(e){
      debugPrint(e.toString());
    }return null;
  }
 Future<void>checkAndLogout()async{
   try{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     String? apikey=preferences.getString('apikey');
     if(apikey!=null){
       Get.context?.loaderOverlay.show();
       await _authProvider.logout();
       Get.context?.loaderOverlay.hide();
       'Logout SuccessFully'.successSnackbar();
     }
   }on BadResponseException catch(e){
     e.message?.errorSnackbar();
   }catch(e){
     debugPrint(e.toString());
   }return null;
   }


 }
