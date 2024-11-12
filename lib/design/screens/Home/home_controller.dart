import 'package:get/get.dart';

import '../../../core/models/get_account_model.dart';
import '../../../core/repositories/home_repository.dart';

class HomeController extends GetxController{
  final HomeRepository homeRepository=Get.find<HomeRepository>();
  bool isLoading=false;
  List<GetAccountModel> account=[];
  Future<void>fetchData()async {
    isLoading=true;
    update();
    account = await  homeRepository.getAccount();
    isLoading=false;
    update();

  }
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

}