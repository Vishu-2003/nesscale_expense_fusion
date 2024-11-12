import 'package:dio/dio.dart';
import 'package:expense_fusion/core/models/response_model.dart';
import '../models/get_space_model.dart';
import '../models/newUser_model.dart';

import '../models/post_expense_model.dart';
import '../models/post_income_model.dart';
import '../services/base_services.dart';

class HomeProvider with BaseServices{


Future<GetResponseModel>addSpace({required String space})async{
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.post(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
            "type": "create_space",
            "data": {"name":space},
        },
        options: Options(extra: requiresToken)

    );
    return GetResponseModel.fromResponse(response);
  });}
Future<GetResponseModel>addAccount({required String account,required String amount,required String space})async{
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.post(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
          "type": "create_account",
          "data": { "name": account, "amount":amount, "space":space}
        },
        options: Options(extra: requiresToken)

    );
    return GetResponseModel.fromResponse(response);
  });}

Future<GetResponseModel>addIncome({required PostIncomeModel income})async{
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.post(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
          "type": "create_income",
          "data":income.toJson()
        },
        options: Options(extra: requiresToken)

    );
    return GetResponseModel.fromResponse(response);
  });}
Future<GetResponseModel>addExpense({required PostExpenseModel expense})async{
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.post(
      "/api/method/expense_fusion.api$apiVersion",
      data: {
        "type": "create_expense",
        "data": expense.toJson()
      },
        options: Options(extra: requiresToken)
    );
    return GetResponseModel.fromResponse(response);
  });}
Future<GetResponseModel>deleteAccount({required String space,required String accountName}){
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.delete(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
          "type": "delete_account",
          "data": {
            "name": accountName,
            "space":space
          }
        },
        options: Options(extra: requiresToken)
    );
    return GetResponseModel.fromResponse(response);
  });}
Future<GetResponseModel>updateAccount({required String space,required String accountName,required String newAccountName,required String amount}){
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.put(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
          "type": "update_account",
          "data": {
            "name":accountName,
            "new_name":newAccountName,
            "space":space,
            "amount":amount
          }
        },
        options: Options(extra: requiresToken)
    );
    return GetResponseModel.fromResponse(response);
  });
}
Future<GetResponseModel>deleteIncome({required String income}){
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.delete(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
          "type": "delete_income",
          "data": {
            "income_id": income
          }
        },
        options: Options(extra: requiresToken)
    );
    return GetResponseModel.fromResponse(response);
  });}
Future<GetResponseModel>deleteExpense({required String expense}){
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.delete(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
        "type": "delete_expense",
        "data": {"expense_id": expense}
        },
        options: Options(extra: requiresToken)
    );
    return GetResponseModel.fromResponse(response);
  });}


}