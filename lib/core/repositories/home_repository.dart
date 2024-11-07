


import 'package:dio/dio.dart';
import 'package:expense_fusion/core/models/response_model.dart';
import 'package:expense_fusion/core/providers/home_provider.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/get_account_model.dart';
import '../models/get_space_model.dart';
import '../models/post_expense_model.dart';
import '../models/post_income_model.dart';
import '../services/base_services.dart';

class HomeRepository with BaseServices{
  final HomeProvider _homeProvider= Get.find<HomeProvider>();

  Future<GetResponseModel?>addIncome({required PostIncomeModel income}) async {
  try{
    return await _homeProvider.addIncome(income: income);
  }on BadResponseException catch(e){
    e.message?.errorSnackbar();
  }catch(e){
    debugPrint(e.toString());
  }return null;
  }
  Future<GetResponseModel?>addExpense({required PostExpenseModel expense})async {
    try{
      return await _homeProvider.addExpense(expense: expense);
    }on BadResponseException catch(e) {
      e.message?.errorSnackbar();
    }catch(e){
      debugPrint(e.toString());
    }return null;
  }
  Future<GetResponseModel?>addSpace({required String space}) async {
    try{
     return await _homeProvider.addSpace(space: space);
    }on BadResponseException catch(e){
      e.message?.errorSnackbar();
    }catch(e){
      debugPrint(e.toString());
    }return null;
  }
  Future<GetResponseModel?>addAccount({required String account,required String amount}) async {
    try{
      return await _homeProvider.addAccount(account: account, amount: amount);
    }on BadResponseException catch(e){
      e.message?.errorSnackbar();
    }catch(e){
      debugPrint(e.toString());
    }return null;
  }
  Future<List<GetSpaceModel>>getSpace()async{
    return tryOrCatch<List<GetSpaceModel>>(()async{
      final response =await dio.get(
          "/api/method/expense_fusion.api$apiVersion",
          data: {
            "type": "get_space"
          },
          options: Options(extra: requiresToken)
      );
      return (response.data['data']as List).map((c)=>GetSpaceModel.fromJson(c)).toList();
    });}
  Future<List<GetAccountModel>>getAccount()async{
    return tryOrCatch<List<GetAccountModel>>(()async{
      final response =await dio.get(
          "/api/method/expense_fusion.api$apiVersion",
          data: {
            "type": "get_account"
          },
          options: Options(extra: requiresToken)
      );
      return (response.data['data']as List).map((c)=>GetAccountModel.fromJson(c)).toList();
    });}

}