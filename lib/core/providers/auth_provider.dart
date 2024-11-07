import 'package:dio/dio.dart';
import 'package:expense_fusion/core/repositories/auth_repository.dart';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/core/services/base_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';
import '../models/newUser_model.dart';
import '../models/response_model.dart';

class AuthProvider with BaseServices{


  Future<GetResponseModel>postCreateNewUser({required PostCreateNewUserModel user})async{
    return tryOrCatch<GetResponseModel>(()async{
      final response =await dio.post(
          "/api/method/expense_fusion.api$apiVersion",
          data: {
            "type": "signup",
            "data": user.toJson()
          }
      );
      return GetResponseModel.fromResponse(response);
    });}

  Future<UserLoginModel>login({required String userName,required String password})async{
    return tryOrCatch<UserLoginModel>(()async {
      final response = await dio.post(
          "/api/method/expense_fusion.api$apiVersion",
          data: {
            "type": "login",
            "data": {"usr": userName, "pwd": password}
          }
      );
      return UserLoginModel.fromMap(response.data);
    });}
  Future<void>logout()async{
    return tryOrCatch<void>(()async{
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.clear();
      Get.offAllNamed(Routes.Login);
    });}
}