import 'package:expense_fusion/design/screens/Expense/expense_controller.dart';
import 'package:expense_fusion/design/screens/Spaces_Accounts/account_controller.dart';
import 'package:expense_fusion/design/screens/Spaces_Accounts/space_acount_controller.dart';
import 'package:expense_fusion/design/screens/startup/signin_view.dart';
import 'package:expense_fusion/design/screens/startup/splashview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../design/screens/Expense/addExpense.dart';
import '../../design/screens/Home/Unknown404.dart';
import '../../design/screens/Home/home_view.dart';
import '../../design/screens/Income/addIncome.dart';
import '../../design/screens/Income/income_controller.dart';
import '../../design/screens/Spaces_Accounts/add_account.dart';
import '../../design/screens/Spaces_Accounts/add_spaces.dart';
import '../../design/screens/Spaces_Accounts/spaces_account_view.dart';
import '../../design/screens/Transaction/transactions.dart';
import '../../design/screens/startup/signin_controller.dart';
import '../../design/screens/startup/signup_controller.dart';
import '../../design/screens/startup/signup_view.dart';
import '../providers/auth_provider.dart';
import '../providers/home_provider.dart';
import '../repositories/auth_repository.dart';
import '../repositories/home_repository.dart';
part   'app_routes.dart';

class AppPages{

static final UnKnown404=GetPage(
  name:Routes.UNKONW_404,
  page: ()=> const Unknown404(),
);

static final List<GetPage<dynamic>> routes = [

  GetPage(
      name: _paths.SPLASH,
      page: ()=> const splashview(),

  ),
  GetPage(
      name: _paths.HOME,
      page: ()=> const HomeView(),
      transition: Transition.native
  ),
 GetPage(
     name: _paths.INCOME,
     page: ()=>const addIncome(),
     binding: BindingsBuilder((){
       Get.lazyPut<IncomeController>(()=>IncomeController(),
       );
     }),
     transition: Transition.circularReveal,
     transitionDuration: Duration(microseconds: 200)
 ),
 GetPage(
     name:_paths.SPACESAccount,
     page:()=>const spacesaccount(),

 ),
 GetPage(
     name:_paths.Transaction,
     page: ()=>const transaction()
 ),
 GetPage(
     name:_paths.AddAccount,
     page: ()=>const addaccount(),

 ),
 GetPage(
     name:_paths.AddSpaces,
     page: ()=>const spaces()
 ),
 GetPage(
     name:_paths.Login,
     page: ()=>const Login(),

 ),
 GetPage(
     name:_paths.Signup,
     page: ()=>const Signup(),
 ),
  GetPage(
      name: _paths.Expense,
      page: ()=>const addExpense(),
      binding: BindingsBuilder((){
        Get.lazyPut<ExpenseController>(()=>ExpenseController(),
        );
      })
  ),
];
}

class BindingX{
  static BindingsBuilder initialBindings(){
    return BindingsBuilder(() {
         Get.put<HomeProvider>(HomeProvider(),permanent: true);
         Get.put<HomeRepository>(HomeRepository(),permanent: true);
         Get.lazyPut<AuthProvider>(()=>AuthProvider(),fenix: true);
         Get.lazyPut<AuthRepository>(()=>AuthRepository(),fenix: true);
    });
  }
}