import 'package:expense_fusion/core/models/get_space_model.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/models/Get_Transaction_model.dart';
import '../../../core/models/response_model.dart';
import '../../../core/repositories/home_repository.dart';

class TransactionController extends GetxController{
  final HomeRepository homeRepository=Get.find<HomeRepository>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
    getTransaction();
  }
   bool isLoading=false;
   Future<void> init ()async{
    await getSpaces();
    await getTransaction();
   }
   String selectedSpace='Select Space';
   void updateSelectedSpace(String space){
     selectedSpace=space;
     update();
   }
   List<String>duration=['Today', '1 Week','1 Month', '6 Month','1 Year'];

   String selectedDuration='Select Duration';
   void updateSelectedDuration(String duration){
     selectedDuration=duration;
     update();
   }
  List<GetTransactionModel>transaction= [];
   Future<void>getTransaction()async {
     isLoading=true;
     update();
     transaction = await homeRepository.getTransaction(
         space: selectedSpace,
         duration: selectedDuration);
     isLoading=false;
     update();
   }
   List<GetSpaceModel>space= [];
   Future<void>getSpaces()async{
     space= await homeRepository.getSpace();
   }
  Future<void> deleteIncome({required String income})async{
    GetResponseModel? response=await homeRepository.deleteIncome(income: income);
    if(response?.message!=null){
      await response?.message?.successSnackbar();
      update();
    }}
  Future<void> deleteExpense({required String expense})async{
    GetResponseModel? response=await homeRepository.deleteExpense(expense: expense);
    if(response?.message!=null){
      await response?.message?.successSnackbar();
      update();
    }

  }

}