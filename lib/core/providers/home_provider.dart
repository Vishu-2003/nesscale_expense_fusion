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
Future<GetResponseModel>addAccount({required String account,required String amount})async{
  return tryOrCatch<GetResponseModel>(()async{
    final response =await dio.post(
        "/api/method/expense_fusion.api$apiVersion",
        data: {
          "type": "create_account",
          "data": {"name": account, "amount":amount}
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


}